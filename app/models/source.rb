class Source < ApplicationRecord
  require 'aylien_text_api'

	has_many :annotations, dependent: :destroy
  has_many :citations, dependent: :destroy
  has_and_belongs_to_many :entities, -> { distinct }
  has_and_belongs_to_many :hashtags, -> { distinct }
  accepts_nested_attributes_for :annotations, :citations

  before_destroy do
    self.hashtags.delete_all
    Hashtag.purge
  end

  before_create do
    unless self.authors.nil?
      self.authors = self.authors.gsub(/[^a-z ,\.]/i,'')
      self.authors = self.authors.gsub(/ +?,/, ', ')
      self.authors = self.authors.strip.chomp(',')
      self.authors = self.authors.squish
    end
  end

  def hashtags_unused
    Hashtag.where.not(id: self.hashtags.map{|hashtag| hashtag.id}).order(:updated_at).reverse.last(10)
  end

  def hashtags_copy=(hashtags)
    self.hashtags.clear
    hashtags.gsub(/\s+/, "").downcase.split('#').reject(&:empty?).each do |content|
      self.hashtags << Hashtag.find_or_create_by(content: content)
      Hashtag.find_by_content(content).touch
    end
    Hashtag.purge # sledge hammer
  end
  def hashtags_copy
    self.hashtags.map{|hashtag| "##{hashtag.content}"}.join(' ')
  end

  # def aylien
  #   # normalize, add title
  #   all_annots = self.title + '. ' + self.annotations.map{|x| x.body}.join(" ")
  #   Acronym.where(is_master: true).each do |acronym|
  #     regexp = /(?!>\w)#{acronym.term}(?!\w)/
  #     acronym.slaves.each do |slave|
  #       all_annots = all_annots.gsub(regexp,slave.term)
  #     end
  #   end

  #   AylienTextApi.configure do |config|
  #     config.app_id = ENV.fetch('aylien_app_id')
  #     config.app_key = ENV.fetch('aylien_api_key')
  #   end
  #   client = AylienTextApi::Client.new

  #   response = client.hashtags(text: all_annots)
  #   response[:hashtags].each do |hashtag|
  #     content = hashtag.gsub('#','')
  #     entity = Entity.find_or_create_by(content: content)
  #     self.entities << entity unless self.entities.include?(entity)
  #   end
  # end

  def has_similar_annotation(body)
    has_similar = false
    self.annotations.each do |annotation|
      unless annotation.body_source.nil?
        has_similar = true if annotation.body_source.similar(body) > 85
      end
    end
    return has_similar
  end

  def has_similar_citation(cited_as)
    has_similar = false
    self.citations.each do |reference|
      has_similar = true if reference.cited_as.similar(cited_as) > 85
    end
    return has_similar
  end

  def annotate(doc_info)
    doc_info[:annotations].each do |body|
      unless self.has_similar_annotation(body)
        annotation = Annotation.create(source_id: self.id, body_source: body, body: body)
      end
    end

    doc_info[:citations].each do |cited_as|
      unless self.has_similar_citation(cited_as)
        citation = Citation.create(source_id: self.id, cited_as: cited_as)
      end
    end
  end

  # def import
  #   doc = Nokogiri::HTML(File.open(self.html_file))
  #   self.authors = doc.css('h2').first.text
  #   self.pdf_link = doc.css('a').first[:href]
  #   if self.save
  #     doc.css('p').each do |obj|
  #       body = obj.text
  #       unless self.has_similar_annotation(body)
  #         annotation = Annotation.create(source_id: self.id, body: body)
  #       end
  #     end
  #   end
  # end

  def self.extract_doc(html_file)
    doc = Nokogiri::HTML(File.open(html_file))

    regexp = /underline \[page \d+\]: (?<text>.+)/
    title = Time.now.strftime("%Y%m%d_%H%M%S")
    authors = nil
    items = doc.css(".item").map {|x| x.text.match(regexp)}
    items.each_with_index do |item,index|
      unless item.nil?
        title = item[:text] if index == 0 
        authors = item[:text] if index == 1 
      end
    end

    regexp = /highlight \[page \d+\]: (?<text>.+)/
    items = doc.css(".item").map {|x| x.text.match(regexp)}
    annotations = items.compact.map {|x| x[:text]}

    regexp = /strikeout \[page \d+\]: (?<text>.+)/
    items = doc.css(".item").map {|x| x.text.match(regexp)}
    citations = items.compact.map {|x| x[:text]}

    {title: title, authors: authors, annotations: annotations, citations: citations}
  end
end
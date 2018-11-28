class Source < ApplicationRecord
	has_many :annotations, dependent: :destroy
  accepts_nested_attributes_for :annotations

  def has_similar_annotation(body)
    has_similar = false
    self.annotations.each do |annotation|
      has_similar = true if annotation.body.similar(body) > 85
    end
    return has_similar
  end

  def annotate(doc_info)
    doc_info[:annotations].each do |body|
      unless self.has_similar_annotation(body)
        annotation = Annotation.create(source_id: self.id, body: body)
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

    {title: title, authors: authors, annotations: annotations}
  end
end
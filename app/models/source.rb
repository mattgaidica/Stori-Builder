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

  def import
    doc = Nokogiri::HTML(File.open(self.html_file))
    self.authors = doc.css('h2').first.text
    self.pdf_link = doc.css('a').first[:href]
    if self.save
      doc.css('p').each do |obj|
        body = obj.text
        unless self.has_similar_annotation(body)
          annotation = Annotation.create(source_id: self.id, body: body)
        end
      end
    end
  end
end
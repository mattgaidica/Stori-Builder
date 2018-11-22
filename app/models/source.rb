class Source < ApplicationRecord
	has_many :annotations, dependent: :destroy
  accepts_nested_attributes_for :annotations

  def self.clean(text)
    text = text.gsub("\n"," ")
    text = text.strip
    text = text.gsub("- ","")
    text[0] = text[0].upcase
    unless text.last.eql? "."
      text = "#{text}."
    end
    return text
  end
end
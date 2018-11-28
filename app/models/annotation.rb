class Annotation < ApplicationRecord
  belongs_to :source, :touch => true
  has_many :strands, dependent: :destroy
  has_many :thoughts, through: :strands
  has_one :hold, dependent: :destroy
  default_scope { order(created_at: :desc) }

  before_create do
    self.body = Annotation.clean(self.body)
  end

  before_update do
    self.body = Annotation.clean(self.body)
  end

  def self.clean(text)
    text = text.gsub("\n"," ")
    text = text.gsub("`","'")
    text = text.strip
    text = text.gsub("- ","")
    text[0] = text[0].upcase
    text = text.chomp(',')
    unless text.last.eql? "."
      text = "#{text}."
    end
    return text
  end
end
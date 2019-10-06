class Annotation < ApplicationRecord
  belongs_to :source, :touch => true
  has_many :strands, dependent: :destroy
  has_many :thoughts, through: :strands
  has_one :hold, dependent: :destroy
  default_scope { order(created_at: :asc) }

  before_create do
    self.body = Annotation.clean(self.body_source)
  end

  before_update do
    unless self.body.present?
      self.destroy
    else
      self.body = Annotation.clean(self.body)
    end
  end

  def self.clean(text)
    text = text.squish
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
class Annotation < ApplicationRecord
  belongs_to :source, :touch => true
  has_many :strands, dependent: :destroy
  has_many :thoughts, through: :strands
  has_one :hold, dependent: :destroy
  default_scope { order(created_at: :desc) }
end
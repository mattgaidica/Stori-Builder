class Annotation < ApplicationRecord
  belongs_to :source, :touch => true
  has_many :strands
  has_many :thoughts, through: :strands#, :order => 'position'
end
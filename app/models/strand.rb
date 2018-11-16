class Strand < ApplicationRecord
  validates :thought, uniqueness: { scope: :annotation }
	belongs_to :thought
	belongs_to :annotation
	default_scope {order(position: :asc)}
end
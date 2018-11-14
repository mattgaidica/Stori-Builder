class Strand < ApplicationRecord
	belongs_to :thought
	belongs_to :annotation
	default_scope {order(position: :asc)}
end
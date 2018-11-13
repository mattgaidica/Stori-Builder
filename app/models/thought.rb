class Thought < ApplicationRecord
	has_many :strands
	has_many :annotations, through: :strands
end
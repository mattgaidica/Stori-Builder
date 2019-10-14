class Hashtag < ApplicationRecord
	has_and_belongs_to_many :sources, -> { distinct }

	before_create do
		self.content.gsub(/\s+/, "").downcase
	end
end

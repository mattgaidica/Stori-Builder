class Hashtag < ApplicationRecord
	has_and_belongs_to_many :sources, -> { distinct }

	before_create do
		self.content.gsub(/\s+/, "").downcase
	end

	# sledge hammer, see source.rb model
	def self.purge
		Hashtag.all.each do |hashtag|
			hashtag.destroy if hashtag.sources.empty? 
		end
	end
end

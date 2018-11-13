class Source < ApplicationRecord
	has_many :annotations, dependent: :destroy
end
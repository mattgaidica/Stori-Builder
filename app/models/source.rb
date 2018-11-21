class Source < ApplicationRecord
	has_many :annotations, dependent: :destroy
  accepts_nested_attributes_for :annotations
end
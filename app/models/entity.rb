class Entity < ApplicationRecord
  has_and_belongs_to_many :sources, -> { distinct }
end
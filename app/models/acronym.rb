class Acronym < ApplicationRecord
  has_one :master, :class_name => 'Acronym', :primary_key => 'like_id', :foreign_key => 'id'
  has_many :slaves, :class_name => 'Acronym', :foreign_key => 'like_id'
end

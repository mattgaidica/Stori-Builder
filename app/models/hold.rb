class Hold < ApplicationRecord
  validates_uniqueness_of :annotation
  belongs_to :annotation
end

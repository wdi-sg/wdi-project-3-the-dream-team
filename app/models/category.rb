class Category < ApplicationRecord
  has_many :events
  has_many :crafters
end

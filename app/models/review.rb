class Review < ApplicationRecord
  belongs_to :event
  belongs_to :craftee
end

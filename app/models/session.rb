class Session < ApplicationRecord
  belongs_to :event
  has_many :bookings
  has_many :participants, through: :bookings, source: :craftee
end

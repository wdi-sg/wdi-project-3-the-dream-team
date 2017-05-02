class Session < ApplicationRecord
  belongs_to :event
  has_many :bookings
  has_many :craftees, through: :bookings
end

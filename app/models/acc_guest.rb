class AccGuest < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :events, through: :bookings
end

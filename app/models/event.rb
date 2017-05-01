class Event < ApplicationRecord
  belongs_to :acc_host
  has_many :bookings
  has_many :acc_guests, through: :bookings
  has_one :event_detail
end

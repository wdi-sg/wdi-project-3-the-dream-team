class Craftee < ApplicationRecord
  belongs_to :user

  has_many :bookings
  has_many :sessions, through: :bookings

  has_many :reviews

  has_many :fav_events

  # may not need this
  has_many :events, through: :fav_events
end

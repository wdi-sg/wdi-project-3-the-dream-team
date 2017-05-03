class Craftee < ApplicationRecord
  belongs_to :user

  has_many :bookings
  has_many :sessions, through: :bookings

  has_many :reviews

  has_many :fav_events
  has_many :events, through: :fav_events # maybe can change to has_many :fav_events, source: events?
end

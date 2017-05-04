class Event < ApplicationRecord
  belongs_to :crafter
  belongs_to :category
  has_one :featured_event

  has_many :reviews

  has_many :fav_events

  has_many :sessions
  # may not work, check bottom
  has_many :bookings, through: :sessions
  has_many :participants, through: :bookings, source: :craftee
end

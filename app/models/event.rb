class Event < ApplicationRecord
  belongs_to :crafter
  belongs_to :category, optional: true

  has_many :sessions
  has_many :bookings, through: :sessions
  has_many :participants, through: :bookings, source: :craftee

  has_many :reviews

  has_many :fav_events

  has_one :featured_event

  validates :name, presence: true
end

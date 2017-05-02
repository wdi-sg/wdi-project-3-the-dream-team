class Event < ApplicationRecord
  belongs_to :crafter

  has_many :reviews
  has_many :sessions
  has_many :bookings, through: :sessions
  has_many :reviews
end

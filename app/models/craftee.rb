class Craftee < ApplicationRecord
  belongs_to :user

  has_many :bookings
  has_many :sessions, through: :bookings

  has_many :reviews

  has_many :fav_events

  validates :name, presence: true
end

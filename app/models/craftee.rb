class Craftee < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :sessions, through: :bookings
  has_many :events, through: :sessions
end

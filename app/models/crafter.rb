class Crafter < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :sessions, through: :events
  has_many :bookings, through: :sessions # check this
  has_many :reviews, through: :events
end

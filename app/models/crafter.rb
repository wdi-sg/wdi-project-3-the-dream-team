class Crafter < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :featured_crafter

  has_many :portfolio_items
  # has_many :events, dependent: :destroy
  has_many :events
  has_many :sessions, through: :events
  has_many :bookings, through: :sessions
  has_many :reviews, through: :events
end

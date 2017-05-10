class Crafter < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_one :featured_crafter

  has_many :portfolio_items
  has_many :events, dependent: :destroy

  has_many :sessions, through: :events
  has_many :bookings, through: :sessions
  has_many :reviews, through: :events

  validates :name, presence: true

  def oauth?
    stripe_account_type == 'oauth'
  end

  def connected?
    !stripe_user_id.nil?
  end
end

class Booking < ApplicationRecord
  belongs_to :craftee
  belongs_to :session
end

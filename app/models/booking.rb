class Booking < ApplicationRecord
  belongs_to :acc_guest
  belongs_to :event
end

class FacilityType < ApplicationRecord
  has_many :facilities
  has_many :bookings
end

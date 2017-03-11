class Facility < ApplicationRecord
  belongs_to :facility_type
  has_many :bookings
end

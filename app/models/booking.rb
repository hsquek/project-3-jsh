class Booking < ApplicationRecord
  belongs_to :facility
  belongs_to :user
  belongs_to :facility_type
end

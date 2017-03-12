class Booking < ApplicationRecord
  belongs_to :facility
  belongs_to :user
  belongs_to :facility_type
  before_save :set_start_time

  def set_start_time
    self.start_time = "#{booking_date} #{start_at}"
  end

end

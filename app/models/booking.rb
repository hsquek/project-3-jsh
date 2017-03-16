class Booking < ApplicationRecord
  belongs_to :facility
  belongs_to :user
  belongs_to :facility_type
  before_save :set_start_time
  before_save :generate_rand_str

 def generate_rand_str
   self.qr_code = Date.today.to_s + "hjfgksd" + user_id.to_s + "fgukuhkjdsf" + booking_date.to_s
 end

  validates :booking_date, presence: true
  validates :user_id, presence: true
  validate :val_start_time
  validate :val_quota
  validate :booking_date_cannot_be_in_the_past


  def val_start_time
      fac_open = FacilityType.find(facility_type_id).opens_at
      fac_close = FacilityType.find(facility_type_id).closes_at
      ses_len = FacilityType.find(facility_type_id).session_length
      if !(start_at.between?(fac_open,(fac_close - ses_len*3600)))
        p "-------------------------"
        p 'this should fail'
        p "-------------------------"
        errors.add(:start_at, "needs to be between #{fac_open} and #{fac_close}")
      else
        p "-------------------------"
        p 'this didnt fail'
        p "-------------------------"
      end
  end

  def val_quota
    fac_quota = FacilityType.find(facility_type_id).quota
    num_user_bookings = Booking.where({user_id: user_id, facility_type_id: facility_type_id, booking_date: Date.today..(Date.today + 100.days)}).length
    if fac_quota<=num_user_bookings && facility_type_id != 4
      p "-------------------------"
      p 'this should fail'
      p "-------------------------"
      errors.add('booking count', "exceeded quota for #{FacilityType.find(facility_type_id).name}")
      p errors
    else
      p "-------------------------"
      p 'this didnt fail'
      p "-------------------------"
    end
  end

  def booking_date_cannot_be_in_the_past
    if booking_date.present? && booking_date < Date.today
      errors.add(:booking_date, "can't be in the past")
      p errors
    end
  end

  def set_start_time
    self.start_time = "#{booking_date} #{start_at}"
  end

end

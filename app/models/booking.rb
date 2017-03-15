class Booking < ApplicationRecord
  belongs_to :facility
  belongs_to :user
  belongs_to :facility_type
  before_save :set_start_time
  before_save :testing

  def testing
    p "-------------------------"
    p facility_type_id.to_i.class
    p facility_type_id.class
    p "-------------------------"
  end

  # fac_open = FacilityType.find("#{facility_type_id}".to_i).opens_at
  # fac_close = FacilityType.find("#{facility_type_id}".to_i).closes_at
  # ses_len = FacilityType.find("#{facility_type_id}".to_i).session_length

  # validates :start_at, inclusion: { in: fac_open..(fac_close - ses_len*3600)}, if: :val_start_time?


  validates :booking_date, presence: true
  validates :user_id, presence: true
  validate :val_start_time


  def val_start_time
    if facility_type_id != 4
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
  end

  def set_start_time
    self.start_time = "#{booking_date} #{start_at}"
  end

end

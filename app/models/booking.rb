class Booking < ApplicationRecord
  belongs_to :facility
  belongs_to :user
  belongs_to :facility_type
  before_save :set_start_time
  before_save :generate_rand_str

 def generate_rand_str
   self.qr_code = "https://floating-ravine-65207.herokuapp.com/qrcodes/" + Date.today.to_s + "hjfgksd" + user_id.to_s + "fgukuhkjdsf" + booking_date.to_s

 end

  def set_start_time
    self.start_time = "#{booking_date} #{start_at}"
  end

end

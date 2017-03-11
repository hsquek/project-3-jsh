class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :facility, foreign_key: true
      t.references :user, foreign_key: true
      t.references :facility_type, foreign_key: true
      t.date :date
      t.time :start_time
      # t.string :time_zone, default: 'GMT+8'

      t.timestamps
    end
  end
end

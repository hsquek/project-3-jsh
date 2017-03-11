class CreateFacilityTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :facility_types do |t|
      t.string :name
      t.integer :quota
      t.integer :capacity
      t.integer :session_length

      t.timestamps
    end
  end
end

class CreateFacilities < ActiveRecord::Migration[5.0]
  def change
    create_table :facilities do |t|
      t.references :facility_type, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end

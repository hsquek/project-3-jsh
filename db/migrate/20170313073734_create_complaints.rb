class CreateComplaints < ActiveRecord::Migration[5.0]
  def change
    create_table :complaints do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :text
      t.boolean :active

      t.timestamps
    end
  end
end

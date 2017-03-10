class AddFieldToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :block, :integer
    add_column :users, :unit, :string
  end
end

class AddDeletedAtToHouses < ActiveRecord::Migration[5.1]
  def change
    add_column :houses, :deleted_at, :datetime
    add_index :houses, :deleted_at
  end
end

class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :size
      t.string :price
      t.text   :information
      t.string :images
      t.string :imageDescriptions

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :houses, :deleted_at
  end
end

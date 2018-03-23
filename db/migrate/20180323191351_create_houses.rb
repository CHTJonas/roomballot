class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :size
      t.string :price
      t.text :information
      t.string :images
      t.string :imageDescriptions

      t.timestamps
    end
  end
end

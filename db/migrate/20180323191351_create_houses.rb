class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :price
      t.text :information

      t.timestamps
    end
  end
end

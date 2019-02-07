class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.text       :url
      t.text       :description
      t.references :dwelling, polymorphic: true, null: true

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :images, :deleted_at
  end
end

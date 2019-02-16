class CreateNewsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :news_items do |t|
      t.string :heading, null: false
      t.text :content, null: false

      t.timestamps
      t.datetime :deleted_at
    end
  end
end

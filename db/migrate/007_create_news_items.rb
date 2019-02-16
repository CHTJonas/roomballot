class CreateNewsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :news_items do |t|
      t.string :heading
      t.text :content

      t.timestamps
      t.datetime :deleted_at
    end
  end
end

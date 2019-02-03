class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text       :comment
      t.references :house, foreign_key: true

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :reviews, :deleted_at
  end
end

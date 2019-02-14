class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email
      t.string  :crsid
      t.integer :year_group
      t.boolean :scholar
      t.boolean :jcr_president
      t.boolean :admin
      t.boolean :blocked
      t.references :ballot_group, foreign_key: true

      t.timestamps
      t.datetime :deleted_at
    end
  end
end

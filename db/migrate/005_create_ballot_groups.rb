class CreateBallotGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :ballot_groups do |t|
      t.string :name, null: false
      t.string :token, null: false
      t.integer :position_in_ballot
      t.references :user, foreign_key: true

      t.timestamps
      t.datetime :deleted_at
    end
    add_index :ballot_groups, :token, unique: true
  end
end

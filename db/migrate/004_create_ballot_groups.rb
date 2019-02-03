class CreateBallotGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :ballot_groups do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
      t.datetime :deleted_at
    end
  end
end

class CreateTimetableItems < ActiveRecord::Migration[5.2]
  def change
    create_table :timetable_items do |t|
      t.datetime :when, null: false
      t.string :description, null: false

      t.timestamps
      t.datetime :deleted_at
    end
  end
end

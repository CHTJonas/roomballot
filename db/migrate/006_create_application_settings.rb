class CreateApplicationSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :application_settings do |t|
      t.binary :shuffle_seed, null: true
    end
  end
end

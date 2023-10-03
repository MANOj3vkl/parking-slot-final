class CreateVehicleHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicle_histories do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.integer :entry_point
      t.references :parking_slot, null: false, foreign_key: true
      t.string :status
      t.datetime :entered_at
      t.datetime :exited_at

      t.timestamps
    end
  end
end

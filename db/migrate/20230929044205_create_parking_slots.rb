class CreateParkingSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :parking_slots do |t|
      t.integer :number
      t.integer :entry_point
      t.string :status

      t.timestamps
    end
  end
end

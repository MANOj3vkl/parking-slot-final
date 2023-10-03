class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :registration_number
      t.references :parking_slot, null: false, foreign_key: true

      t.timestamps
    end
  end
end

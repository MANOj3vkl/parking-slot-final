class AddEntryTimeToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :entry_time, :datetime
  end
end

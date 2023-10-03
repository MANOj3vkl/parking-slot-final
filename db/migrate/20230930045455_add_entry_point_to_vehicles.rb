class AddEntryPointToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :entry_point, :string
  end
end

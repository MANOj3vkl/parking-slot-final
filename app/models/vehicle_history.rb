class VehicleHistory < ApplicationRecord
  belongs_to :vehicle
  belongs_to :parking_slot
end

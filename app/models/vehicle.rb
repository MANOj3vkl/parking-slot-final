class Vehicle < ApplicationRecord
  belongs_to :parking_slot
  has_one :vehicle_history

  validate :entry_within_24_hours, on: :create


  def entry_within_24_hours
    if Vehicle.where('registration_number = ? AND entry_time >= ?', registration_number, 24.hours.ago).exists?
      errors.add(:base, 'Vehicle already entered within the last 24 hours.')
    end
  end

  def vehicle_params
    params.require(:vehicle).permit(:registration_number, :entry_time)
  end

end

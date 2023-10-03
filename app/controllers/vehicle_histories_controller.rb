class VehicleHistoriesController < ApplicationController
  def search
    registration_number = params[:registration_number]
    @vehicle_histories = VehicleHistory.includes(:vehicle, :parking_slot)
                                       .where(vehicle: { registration_number: registration_number })
                                       .order(entered_at: :desc)

  end
end

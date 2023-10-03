  class VehiclesController < ApplicationController
    before_action :authenticate_user!


    def new
      @vehicle = Vehicle.new
    end

    def show
      @vehicle = Vehicle.find(params[:id])
    end

    def create
      @vehicle = Vehicle.new(vehicle_params)
      @vehicle.entry_time = Time.now  # Set the entry timestamp

      if @vehicle.save
        entry_point = @vehicle.entry_point

        VehicleHistory.create(
                vehicle: @vehicle,
                entry_point: @vehicle.entry_point,
                parking_slot: @vehicle.parking_slot,
                status: 'entered',
                entered_at: Time.now
              )

        redirect_to parking_slot_path(@vehicle.parking_slot)

        if @available_slot
          # Assign the parking slot to the vehicle
          @vehicle.parking_slot = @available_slot
          @available_slot.update(status: 'booked')
          flash[:notice] = 'Vehicle entered parking successfully.'

        else
          flash[:alert] = 'No available parking slots at this entry point.'
          redirect_to root_path
        end
      else
        flash[:alert] = 'Failed to enter the parking.'
        render :new
      end
    end

    private

    def vehicle_params
      params.require(:vehicle).permit(:entry_point, :registration_number)
    end
  end
# end

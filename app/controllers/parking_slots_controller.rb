class ParkingSlotsController < ApplicationController

  def index
    @entry_point = params[:entry_point]
    @available_slot = ParkingSlot.find_by(entry_point: @entry_point, status: 'available')

    if @available_slot
      @available_slot.update(status: 'booked')
      redirect_to parking_slot_path(@available_slot)
    else
      flash[:alert] = 'No available parking slots at this entry point.'
      redirect_to root_path
    end
  end

  def create
    @entry_point = params[:entry_point]
    @available_slot = ParkingSlot.find_by(entry_point: @entry_point, status: 'available')

    if @available_slot
      @available_slot.update(status: 'booked')

      # Create a new VehicleHistory record when a vehicle enters
      VehicleHistory.create(
        vehicle: @available_slot.vehicle,
        entry_point: @entry_point,
        status: 'entered',
        entered_at: Time.now
      )

      redirect_to parking_slot_path(@available_slot)
    else
      flash[:alert] = 'No available parking slots at this entry point.'
      redirect_to root_path
    end
  end

  def exit
    @parking_slot = ParkingSlot.find(params[:id])

    if @parking_slot.update(status: 'available')
      flash[:notice] = 'Parking slot has been marked as available.'

      vehicle_history = VehicleHistory.find_by(
        vehicle: @parking_slot.vehicle,
        entry_point: @parking_slot.entry_point,
        status: 'entered'
      )

      if vehicle_history
        vehicle_history.update(status: 'exited', exited_at: Time.now)
      end


    else
      flash[:alert] = 'Failed to update parking slot status.'
    end

    redirect_to parking_slots_path(entry_point: @parking_slot.entry_point)

  end

  def show
    @parking_slot = ParkingSlot.params[:id]
  end

  private

  def parking_slot_params
    params.require(:parking_slot).permit(:number, :entry_point, :status)
  end
end

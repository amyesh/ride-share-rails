class TripsController < ApplicationController
  def index
    if params[:driver_id]
      @driver = Driver.find_by(id: params[:driver_id])
      @driver_trips = @driver.trips

    elsif params[:passenger_id]
      @passenger = Passenger.find_by(id: params[:passenger_id])
      @passenger_trips = @passenger.trips
    else
      @trips = Trip.all.order(:id) 
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :date, :rating, :cost)
  end
end

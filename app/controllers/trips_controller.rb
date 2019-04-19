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

  def show
    trip_id = params[:id]
    @trip = Trip.find_by(id: trip_id)

    if @trip.nil?
      head :not_found
    end
  end

  def create
    # find available driver
    # create trip with available driver
    # change status of available driver
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    trip = Trip.find_by(id: params[:id])

    is_successful = trip.update(trip_params)

    if is_successful
      redirect_to trip_path(trip.id)
    else
      @trip = trip
      render :edit, status: :bad_request
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :date, :rating, :cost)
  end
end

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
    @driver = Driver.find_by(availability: true)
    @trip = Trip.new(
      driver_id: @driver.id,
      passenger_id: params[:passenger_id],
      date: Date.current,
      cost: rand(100..20000),
      rating: 1, # should be nil
    )

    save_is_successful = @trip.save
    if save_is_successful
      @driver.availability = false
      @driver.save
      redirect_to trip_path(@trip.id)
    else
      render :new, status: :bad_request
    end
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

  def destroy
    trip = Trip.find_by(id: params[:id])

    if trip.nil?
      head :not_found
    else
      trip.destroy
      redirect_to trips_path
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :date, :rating, :cost)
  end
end

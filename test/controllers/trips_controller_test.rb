require "test_helper"
require "pry"

describe TripsController do
  describe "index" do
    it "can get index" do
      get trips_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "should be OK to show an existing, valid driver" do
      driver = Driver.create(name: "Amy Martinsen", vin: "ABCDEFG")
      passenger = Passenger.create(name: "Faiza Ahsan", phone_num: "555-555-5555")
      trip = Trip.create(passenger_id: passenger.id, driver_id: driver.id, rating: 5, cost: 1474, date: "2016-06-02")
      valid_trip_id = trip.id
      # binding.pry

      get trip_path(valid_trip_id)

      must_respond_with :success
    end

    it "should give a 404 instead of showing a non-existent, invalid trip" do
      invalid_trip_id = -1

      get trip_path(invalid_trip_id)

      must_respond_with :not_found
    end
  end

  describe "edit" do
    # Your tests go here
  end

  describe "update" do
    # Your tests go here
  end

  describe "create" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end

# def index
#   if params[:driver_id]
#     @driver = Driver.find_by(id: params[:driver_id])
#     @driver_trips = @driver.trips

#   elsif params[:passenger_id]
#     @passenger = Passenger.find_by(id: params[:passenger_id])
#     @passenger_trips = @passenger.trips
#   else
#     @trips = Trip.all.order(:id)
#   end
# end

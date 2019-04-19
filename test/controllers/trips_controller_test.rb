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
    it "can get edit path for trip" do
      driver = Driver.create(name: "Amy Martinsen", vin: "ABCDEFG")
      passenger = Passenger.create(name: "Faiza Ahsan", phone_num: "555-555-5555")
      trip = Trip.create(passenger_id: passenger.id, driver_id: driver.id, rating: 5, cost: 1474, date: "2016-06-02")
      get edit_trip_path(trip.id)
      must_respond_with :success
    end
  end

  describe "update" do
    it "will update an existing trip" do
      driver = Driver.create(name: "Amy Martinsen", vin: "ABCDEFG")
      passenger = Passenger.create(name: "Faiza Ahsan", phone_num: "555-555-5555")
      trip_to_update = Trip.create(passenger_id: passenger.id, driver_id: driver.id, rating: 5, cost: 1474, date: "2016-06-02")

      input_rating = 3
      input_cost = 1602
      test_input = {
        "trip": {
          rating: input_rating,
          cost: input_cost,
          passenger_id: passenger.id,
          driver_id: driver.id,
          date: "2016-06-02",
        },
      }

      expect {
        patch trip_path(trip_to_update.id), params: test_input
      }.wont_change "Trip.count"

      must_respond_with :redirect
      trip_to_update.reload
      expect(trip_to_update.rating).must_equal test_input[:trip][:rating]
      expect(trip_to_update.cost).must_equal test_input[:trip][:cost]
    end

    it "will return a bad_request (400) when asked to update with invalid data" do
      driver = Driver.create(name: "Amy Martinsen", vin: "ABCDEFG")
      passenger = Passenger.create(name: "Faiza Ahsan", phone_num: "555-555-5555")
      starter_input = {
        rating: 5,
        cost: 1602,
        passenger_id: passenger.id,
        driver_id: driver.id,
        date: "2016-06-02",
      }
      trip_to_update = Trip.create(starter_input)

      test_input = {
        "trip": {
          rating: 3,
          cost: 1602,
          passenger_id: nil,
          driver_id: driver.id,
          date: "2016-06-02",
        },
      }

      # Act
      expect {
        patch trip_path(trip_to_update.id), params: test_input
      }.wont_change "Trip.count"

      # Assert
      must_respond_with :bad_request
      trip_to_update.reload
      expect(trip_to_update.passenger_id).must_equal starter_input[:passenger_id]
      expect(trip_to_update.rating).must_equal starter_input[:rating]
    end
  end

  describe "create" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end

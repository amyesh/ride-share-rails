require "test_helper"

describe PassengersController do
  describe "index" do
    it "should get index" do
      get passengers_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "should be OK to show an existing passenger" do
      passenger = Passenger.new(name: "David Black", phone_num: "123-456-7890")
      passenger_id = passenger.id

      get passenger_path(passenger_id)

      must_respond_with :success
    end

    it "should give a 404 instead of showing a non-existant passenger" do
      invalid_id = 999
      get passenger_path(invalid_id)
      must_respond_with :not_found
    end
  end

  describe "edit" do
    # Your tests go here
  end

  describe "update" do
    # Your tests go here
  end

  describe "new" do
    # Your tests go here
  end

  describe "create" do
    # Your tests go here
  end

  describe "destroy" do
    # Your tests go here
  end
end

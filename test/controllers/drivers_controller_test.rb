require "test_helper"

describe DriversController do
  describe "index" do
    it "can get index" do
      get drivers_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "should be OK to show an existing, valid driver" do
      driver = Driver.create(name: "Faiza Ahsan", vin: "ABCDEFG")
      valid_driver_id = driver.id

      get driver_path(valid_driver_id)

      must_respond_with :success
    end

    it "should give a 404 instead of showing a non-existant, invalid driver" do
      invalid_driver_id = 999

      get driver_path(invalid_driver_id)

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
    it "will save a new driver and redirect if valid" do
      driver_name = "Amy Martinson"
      driver_vin = "ABCDEFGH123456789"
      test_driver = {
        "driver": {
          name: driver_name,
          vin: driver_vin
        }
      }

      expect {
        post drivers_path, params: test_driver
      }.must_change 'Driver.count', 1

      new_driver = Driver.find_by(name: driver_name)
      expect(new_driver).wont_be_nil
      expect(new_driver.name).must_equal driver_name
      expect(new_driver.vin).must_equal driver_vin

      must_respond_with :redirect
    end

    # it "will return a 400 for an invalid driver" do

    # end
  end

  describe "destroy" do
    # Your tests go here
  end
end

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
      invalid_driver_id = -1

      get driver_path(invalid_driver_id)

      must_respond_with :not_found
    end
  end

  describe "edit" do
    it "can get edit path for driver" do
      driver = Driver.create(name: "Faiza Ahsan", vin: "ABCDEFG")

      get edit_driver_path(driver.id)
      must_respond_with :success
    end
  end

  describe "update" do
    it "will update an existing driver" do
      starter_input = {
        name: "Faiza Ahsad",
        vin: "LMNOP",
      }

      driver_to_update = Driver.create(starter_input)

      input_name = "Amy Martinsen"
      input_vin = "GKLMONP"
      test_input = {
        "driver": {
          name: input_name,
          vin: input_vin,
        },
      }

      expect {
        patch driver_path(driver_to_update.id), params: test_input
      }.wont_change "Driver.count"

      must_respond_with :redirect
      driver_to_update.reload
      expect(driver_to_update.name).must_equal test_input[:driver][:name]
      expect(driver_to_update.vin).must_equal test_input[:driver][:vin]
    end

    it "will return a bad_request (400) when asked to update with invalid data" do
      starter_input = {
        name: "Punchinello Funny Fellow",
        vin: "452340923844ASDLK",
      }

      driver_to_update = Driver.create(starter_input)

      input_name = ""
      input_vin = "ASDLFJASKDFH"
      test_input = {
        "driver": {
          name: input_name,
          vin: input_vin,
        },
      }

      # Act
      expect {
        patch driver_path(driver_to_update.id), params: test_input
      }.wont_change "Driver.count"

      # Assert
      must_respond_with :bad_request
      driver_to_update.reload
      expect(driver_to_update.name).must_equal starter_input[:name]
      expect(driver_to_update.vin).must_equal starter_input[:vin]
    end
  end

  describe "new" do
    it "can get new path for driver" do
      get new_driver_path
      must_respond_with :success
    end
  end

  describe "create" do
    it "will save a new driver and redirect if valid" do
      driver_name = "Amy Martinsen"
      driver_vin = "ABCDEFGH123456789"
      test_driver = {
        "driver": {
          name: driver_name,
          vin: driver_vin,
        },
      }

      expect {
        post drivers_path, params: test_driver
      }.must_change "Driver.count", 1

      new_driver = Driver.find_by(name: driver_name)
      expect(new_driver).wont_be_nil
      expect(new_driver.name).must_equal driver_name
      expect(new_driver.vin).must_equal driver_vin

      must_respond_with :redirect
    end

    it "will return a 400" do
      driver_name = ""
      driver_vin = "ABCDEFGH123456789"
      test_driver = {
        "driver": {
          name: driver_name,
          vin: driver_vin
        }
      }
      new_driver = Driver.create(test_driver["driver"])
      expect {
        post drivers_path, params: test_driver
      }.wont_change "Driver.count"

      must_respond_with :bad_request
    end
  end

  describe "destroy" do
    it "can delete a driver" do
      driver = Driver.create(name: "Amy Martinson", vin: "ABCDEFGH123456789")

      expect {
        delete driver_path(driver.id)
      }.must_change "Driver.count", -1

      must_respond_with :redirect
      must_redirect_to drivers_path
    end
    
    it "returns a 404 if the driver is not valid" do
      invalid_driver_id = -1

      get driver_path(invalid_driver_id)
      must_respond_with :not_found
    end
  end
end

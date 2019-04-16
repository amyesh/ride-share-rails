require "test_helper"

describe PassengersController do
  describe "index" do
    it "should get index" do
      get passengers_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "should be OK to show an existing, valid passenger" do
      passenger = Passenger.create(name: "Faiza Husain", phone_num: "555-555-5555")
      valid_passenger_id = passenger.id

      get passenger_path(valid_passenger_id)

      must_respond_with :success
    end

    it "should give a 404 instead of showing a non-existant, invalid passenger" do
      invalid_passenger_id = 999

      get passenger_path(invalid_passenger_id)

      must_respond_with :not_found
    end
  end

  # describe "edit" do
  #   # Your tests go here
  # end

  describe "update" do
    it "will update an existing passenger" do
      starter_input = {
        name: "Faiza Ahsad",
        phone_num: "555-555-5555",
      }

      passenger_to_update = Passenger.create(starter_input)

      input_name = "Amy Martinsen"
      input_phone_num = "222-222-2222"
      test_input = {
        "passenger": {
          name: input_name,
          phone_num: input_phone_num,
        },
      }

      expect {
        patch passenger_path(passenger_to_update.id), params: test_input
      }.wont_change "Passenger.count"

      must_respond_with :redirect
      passenger_to_update.reload
      expect(passenger_to_update.name).must_equal test_input[:passenger][:name]
      expect(passenger_to_update.phone_num).must_equal test_input[:passenger][:phone_num]
    end

    it "will return a bad_request (400) when asked to update with invalid data" do
      starter_input = {
        name: "Punchinello Funny Fellow",
        phone_num: "867-5309",
      }

      passenger_to_update = Passenger.create(starter_input)

      input_name = ""
      input_phone_num = "123-456-7890"
      test_input = {
        "passenger": {
          name: input_name,
          phone_num: input_phone_num,
        },
      }

      # Act
      expect {
        patch passenger_path(passenger_to_update.id), params: test_input
      }.wont_change "Passenger.count"

      # Assert
      must_respond_with :bad_request
      passenger_to_update.reload
      expect(passenger_to_update.name).must_equal starter_input[:name]
      expect(passenger_to_update.phone_num).must_equal starter_input[:phone_num]
    end
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

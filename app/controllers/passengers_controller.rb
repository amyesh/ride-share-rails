class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all.order(:id)
  end

  def show
    passenger_id = params[:id]
    @passenger = Passenger.find_by(id: passenger_id)
    if @passenger.nil?
      head :not_found
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
  end

  def update
    passenger = Passenger.find_by(id: params[:id])

    is_successful = passenger.update(passenger_params)

    if is_successful
      redirect_to passenger_path(passenger.id)
    else
      @passenger = passenger
      render :edit, status: :bad_request
    end
  end
end

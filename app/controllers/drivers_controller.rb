class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:id)
  end

  def new 
    @driver = Driver.new(name: "John Doe", vin: "123456789ABCDEFGH")
  end

  def create
    @driver = Driver.new(driver_params)

    save_is_successful = @driver.save

    if save_is_successful
      redirect_to driver_path(@driver.id)
    else
      render :new, status: :bad_request
    end
  end

  private 

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end

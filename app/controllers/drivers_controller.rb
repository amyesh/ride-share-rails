class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:id)
  end

<<<<<<< HEAD
  def show
    driver_id = params[:id]
    @driver = Driver.find_by(id: driver_id)
    if @driver.nil?
      head :not_found
    end
  end
=======
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
>>>>>>> ef3af17f1456765f71d3da975f681e8b875a9d36
end

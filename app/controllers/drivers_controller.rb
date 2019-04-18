class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:name)
  end

  def show
    driver_id = params[:id]
    @driver = Driver.find_by(id: driver_id)
    if @driver.nil?
      head :not_found
    end
  end

  def new
    @driver = Driver.new(name: "John Doe", vin: "123456789ABCDEFGH")
  end

  def create
    driver = Driver.new(driver_params)

    save_is_successful = driver.save

    if save_is_successful
      redirect_to driver_path(driver.id)
    else
      @driver = driver
      render :new, status: :bad_request
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  def update
    driver = Driver.find_by(id: params[:id])

    is_successful = driver.update(driver_params)

    if is_successful
      redirect_to driver_path(driver.id)
    else
      @driver = driver
      render :edit, status: :bad_request
    end
  end

  def destroy
    driver = Driver.find_by(id: params[:id])

    if driver.nil?
      head :not_found
    else
      driver.destroy
      redirect_to drivers_path
    end
  end

  def toggle_availability
    driver = Driver.find_by(id: params[:id])
    driver.toggle(:availability)
    driver.save
    redirect_to drivers_path
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end

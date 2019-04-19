class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :driver_id, presence: true
  validates :passenger_id, presence: true
  validates :date, presence: true
  validates :rating, presence: false
  validates :cost, presence: true

  def driver_name
    driver = self.driver
    if driver
      return driver.name
    else
      return "Unknown"
    end
  end

  def passenger_name
    passenger = self.passenger
    if passenger
      return passenger.name
    else
      return "Unknown"
    end
  end
end # class end

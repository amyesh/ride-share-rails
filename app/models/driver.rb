class Driver < ApplicationRecord
  has_many :trips
  
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true

  def average_rating
    sum = 0.0
    total_trips = self.trips.count

    if self.trips.length == 0
      return 0.0
    end

    self.trips.each do |trip|
      sum += trip.rating
    end

    avg_rating = (sum / total_trips).to_f

    return avg_rating.round(1)
  end # method
end # class end

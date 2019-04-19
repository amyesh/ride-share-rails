class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :car_make, presence: true
  validates :car_model, presence: true
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

  def total_revenue
    revenue = 0.0

    self.trips.each do |trip|
      if trip.cost == nil
        revenue += 0
      elsif trip.cost < 1.65
        revenue += 0
      else
        revenue += ((trip.cost - 1.65) * 0.8).round(2)
      end
    end
    return revenue
  end
end # class end

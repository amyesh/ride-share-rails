class Driver < ApplicationRecord
  has_many :trips
  
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true

 def average_rating
      this_drivers_ratings = []
      average_rating = 0

      if self.trips.length == 0
        return average_rating
      else
        self.trips.each do |trip|
          this_drivers_ratings << trip.rating
        end      
        average_rating = this_drivers_ratings.sum / this_drivers_ratings.length
        
        average_rating = average_rating.round(2)
      end
      return average_rating.to_f
    end
end # class end


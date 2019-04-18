class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :phone_num, presence: true, uniqueness: true

  def net_expenditures
    total_amount = 0.0

    self.trips.each do |trip|
      if trip.cost != nil
        total_amount += trip.cost
      end
    end
    return total_amount
  end
end # class end

class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true, uniqueness: true
  validates :vin, presence: true, uniqueness: true
end

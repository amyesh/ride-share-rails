class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: true, uniqueness: true
  validates :phone_num, presence: true, uniqueness: true
end

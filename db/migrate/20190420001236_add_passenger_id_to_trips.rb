class AddPassengerIdToTrips < ActiveRecord::Migration[5.2]
  def change
    add_reference :trips, :passenger, foreign_key: true, on_delete: :cascade
  end
end

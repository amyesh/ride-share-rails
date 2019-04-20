class AddDriverIdToTrips < ActiveRecord::Migration[5.2]
  def change
    add_reference :trips, :driver, foreign_key: :true, on_delete: :cascade
  end
end

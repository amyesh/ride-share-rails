class UpdateForeignKeyAddOnDeleteConstraint < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :trips, :passengers
    add_foreign_key :trips, :passengers, on_delete: :cascade
  end
end

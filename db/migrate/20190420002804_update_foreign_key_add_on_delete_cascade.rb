class UpdateForeignKeyAddOnDeleteCascade < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :trips, :drivers
    add_foreign_key :trips, :drivers, on_delete: :cascade
  end
end

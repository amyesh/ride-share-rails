class AddVinToDriver < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :vin, :string
  end
end

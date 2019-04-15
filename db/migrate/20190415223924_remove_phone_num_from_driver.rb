class RemovePhoneNumFromDriver < ActiveRecord::Migration[5.2]
  def change
    remove_column :drivers, :phon_num
  end
end

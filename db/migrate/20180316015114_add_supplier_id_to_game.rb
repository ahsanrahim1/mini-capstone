class AddSupplierIdToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :supplier_id, :integer
  end
end

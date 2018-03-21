class RenameProducIdtoGameId < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :product_id, :game_id
  end
end

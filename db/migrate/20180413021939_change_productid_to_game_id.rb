class ChangeProductidToGameId < ActiveRecord::Migration[5.1]
  def change
    rename_column :images, :product_id, :game_id

  end
end

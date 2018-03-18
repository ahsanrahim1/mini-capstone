class RemoveImageFromProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :image_url, :string
  end
end

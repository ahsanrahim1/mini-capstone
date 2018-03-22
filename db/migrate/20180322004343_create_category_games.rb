class CreateCategoryGames < ActiveRecord::Migration[5.1]
  def change
    create_table :category_games do |t|
      t.integer :game_id
      t.integer :category_id

      t.timestamps
    end
  end
end

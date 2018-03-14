class Changepricetodecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :games, :price, :decimal, precision: 9, scale: 2
  end
end

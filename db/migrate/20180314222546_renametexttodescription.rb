class Renametexttodescription < ActiveRecord::Migration[5.1]
  def change
    rename_column :games, :text, :description
  end
end

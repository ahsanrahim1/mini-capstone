class RenameDescriptiontoText < ActiveRecord::Migration[5.1]
  def change
    rename_column :games, :description, :text
  end
end

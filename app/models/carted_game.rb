class CartedGame < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :order, optional: true

  def as_json
    {
      id:id,
      game: game.as_json,
      quantity: quantity
    }
  end
end

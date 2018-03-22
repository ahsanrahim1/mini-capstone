class Category < ApplicationRecord
  has_many :category_games
  has_many :games, through: :category_games

  def as_json
    {
      name: name,
      games: games.map {|game| game.name}
    }
  end
end

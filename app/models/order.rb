class Order < ApplicationRecord

  belongs_to :user 
  has_many :carted_games
  has_many :games, through: :carted_games

end

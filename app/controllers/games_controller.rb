class GamesController < ApplicationController

  def all_games
    game = Game.all
    game_hashes = game.map do |game|{
      Name:game.name,
      Price:game.price,
      Image_url:game.image_url,
      Description:game.description 

      }
    end
    render json: game_hashes
  end


  def fifa_18
    game = Game.first
    render json: {
      Name:game.name,
      Price:game.price,
      Image_url:game.image_url,
      Description:game.description 
    }
  end

  def mkombat_x
    game = Game.last
    render json: {
      Name:game.name,
      Price:game.price,
      Image_url:game.image_url,
      Description:game.description 
    }
  end

end

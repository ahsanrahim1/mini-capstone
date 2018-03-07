class GamesController < ApplicationController

  def all_games
    game = Game.all
    render json: game.as_json
  end


  def fifa_18
    game = Game.first
    render json: game.as_json
    
  end

  def mkombat_x
    game = Game.second
    render json: game.as_json
   
  end

end

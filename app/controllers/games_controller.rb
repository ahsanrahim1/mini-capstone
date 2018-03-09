class V2::GamesController < ApplicationController


  def show
    game_id = params["id"]
    game = Game.find_by(id: game_id)
    render json: game
  end



  def index
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

  def find_game
    id= prams["id"]
    
  end


  def create
    game = Game.new(
      name: params["input_name"],
      price: params["input_price"],
      image_url: params["input_image_url"],
      description: params["input_description"]
      )
    game.save
    render json: game.as_json
  end

end




class V2::GamesController < ApplicationController
  def show
    game_id = params["id"]
    game = Game.find_by(id: game_id)
    render json: game
  end

  def index
    game = Game.all.order(:id)
    render json: game.as_json
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

  def update
    game_id = params["id"] 
    game = Game.find_by(id: game_id)
    game.name = params["input_name"] || game.name 
    game.price = params["input_price"] || game.price
    game.image_url = params["input_image_url"] || game.image_url
    game.description = params["input_description"] || game.description
    game.save
    render json: game.as_json
  end

  def delete 
    game_id = params["id"] 
    game = Game.find_by(id: game_id)
    game.destroy
    render json: {message: "Game Removed"}
  end
end

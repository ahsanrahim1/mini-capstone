class V2::CartedGamesController < ApplicationController
  before_action :authenticate_user
  def index
    carted_games = current_user.carted_games.where(status: "Carted")
    render json: carted_games.as_json
  end

  def create
    carted_game = CartedGame.new(
      game_id: params["game_id"],
      quantity: params["quantity"],
      user_id: current_user.id,
      status: "Carted"
      )
    carted_game.save
    render json: carted_game.as_json
  end

  def destroy
    carted_game = CartedGame.find_by(id: params[:id])
    carted_game.status = "removed"
    carted_game.save
    render json: {status: "Carted product successfully removed!"}
  end
end

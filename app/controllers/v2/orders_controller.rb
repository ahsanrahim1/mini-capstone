class V2::OrdersController < ApplicationController

  def index
    orders = current_user.orders 
    render json: orders.as_json
  end
  def create
    game = Game.find_by(id:params["game_id"])
    calculated_subtotal = game.price * params["quantity"].to_i
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_tax + calculated_subtotal



    order = Order.new(
      user_id: current_user.id,
      game_id: params["game_id"],
      quantity: params["quantity"],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
         )
    order.save

    render json: order.as_json
  end
end

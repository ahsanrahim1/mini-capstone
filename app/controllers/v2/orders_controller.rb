class V2::OrdersController < ApplicationController
  before_action :authenticate_user
  def index
    orders = current_user.orders 
    render json: orders.as_json
  end
  def create
    carted_games = CartedGame.where(status: "Carted" , user_id: current_user.id)
    # calculated_subtotal = game.price * params["quantity"].to_i
    # calculated_tax = calculated_subtotal * 0.09
    # calculated_total = calculated_tax + calculated_subtotal
    calculated_subtotal = 0
    
    carted_games.each do |carted_game|
      calculated_subtotal += carted_game.game.price * carted_game.quantity
    end
    puts "-" * 50
    puts "calculated_subtotal is #{calculated_subtotal}"
    puts "carted_games length #{carted_games.length}"
    puts "-" * 50
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax
    order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
         )
    order.save
    carted_games.update_all(status: "purchased", order_id: order.id)

    render json: order.as_json
  end
end

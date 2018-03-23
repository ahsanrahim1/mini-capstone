class Order < ApplicationRecord

  belongs_to :user 
  belongs_to :game
  has_many :carted_products
  

end

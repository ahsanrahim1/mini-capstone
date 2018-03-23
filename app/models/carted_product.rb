class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :order, optional: true
end

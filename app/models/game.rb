class Game < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..300 }

 
  def is_discounted
    if price <20
      answer = "yes"
    else
      answer = "no"
    end
    return answer
  end

  def tax
    price * 0.09 
  end

  def total
    price + tax
  end

  def as_json
    {
      id: id,
      name:name,
      price: price,
      image_url:image_url,
      description:description,
      is_discounted: is_discounted,
      tax: tax,
      total:total,
    }
  end
end

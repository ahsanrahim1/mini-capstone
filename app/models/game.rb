class Game < ApplicationRecord
  def is_discounted
    if price <20
      answer = "yes"
    else
      answer = "no"
    end
    return answer
  end

  def tax
    price / 9 
  end

  def total
    price + tax
  end

  def as_json
    {
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

class V2::CategoriesController < ApplicationController
  def show
    category_id = params["category_id"]
    category = Category.find_by(id: category_id)
    render json: category.as_json
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace:v1 do 

    get "/fifa_18" => "games#fifa_18"

    get "/mkombat_x" => "games#mkombat_x"
  end

  namespace:v2 do
    get "/games" => "games#index"

    get "/game/:id" => "games#show"

    post "/games" => "games#create"

    patch "/games/:id" => "games#update"
  end
  
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace:v1 do 
    get "/games_url" => "games#all_games"
      
    get "/fifa_18" => "games#fifa_18"

    get "/mkombat_x" => "games#mkombat_x"

  end
end

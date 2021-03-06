  Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do 
    get "/fifa_18" => "games#fifa_18"
    get "/mkombat_x" => "games#mkombat_x"
  end

  namespace :v2 do
    get "/games" => "games#index"
    get "/games/:id" => "games#show"
    post "/games" => "games#create"
    patch "/games/:id" => "games#update"
    delete "/games/:id" => "games#delete"
    post "/users" => "users#create"
    post "/orders" => "orders#create"
    get "/orders" => "orders#index"
    get "/categories" => "categories#show"
    post "/cart" => "carted_games#create"
    get "/cart" => "carted_games#index" 
    delete "/cart/:id" =>"carted_games#destroy"


 
  end
end

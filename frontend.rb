require "unirest"


puts "========Login=========="
print "Enter Email :"
email = gets.chomp
print "Enter password :"
password = gets.chomp

response = Unirest.post(
  "http://localhost:3000/user_token",
  parameters: {
    auth: {
      email: "#{email}",
      password: "#{password}"
    }
  }
)

# Save the JSON web token from the response
jwt = response.body["jwt"]
# Include the jwt in the headers of any future web requests
Unirest.default_header("Authorization", "Bearer #{jwt}")



while true


  system "clear"
  p jwt
  puts "Welcome to my Gaming store"
  puts "To view all games enter [all]"
  puts "To search by name press [search]"
  puts "To view Individual Games enter [1]"
  puts "To add a new game to our ever growing collection enter [2]"
  puts "To edit a game entry press 3"
  puts "To remove a game entry press 4"
  puts "To create a new account enter [signup]"
  puts "to logout enter [logout]"
  puts "to order [order]"
  puts "To view all orders press [5]"
  puts "To view products of a category [6]"
  puts "To cart a product [7]"
  puts "To view all your carted products press [8]"
  puts "to remove a carted product [9]"


  input_word=gets.chomp
     

  if input_word == "all"
    response=Unirest.get("http://localhost:3000/v2/games")
    game=response.body
    puts JSON.pretty_generate(game)

  elsif input_word == "search"
    print " Enter name : "
    search = gets.chomp
    response=Unirest.get("http://localhost:3000/v2/games?search_terms=#{search}")
    game=response.body
    puts JSON.pretty_generate(game)

  elsif input_word == "1"
    puts "Enter game id:"
    game_id = gets.chomp
    response=Unirest.get("http://localhost:3000/v2/game/#{game_id}")
    game=response.body
    puts JSON.pretty_generate(game)



  elsif input_word == "2"
    params = {}
    print "Name of Game:"
    params["input_name"]=gets.chomp
    print "Price:"
    params["input_price"]=gets.chomp
    # print "Image Url:"
    # params["input_image_url"]=gets.chomp
    print "Description:"
    params["input_description"]=gets.chomp
    print "Supplier Id :"
    params["supplier_id"]=gets.chomp
    response = Unirest.post("http://localhost:3000/v2/games", parameters: params)
    game= response.body
    puts JSON.pretty_generate(game)

  elsif input_word == "3"
    puts "Enter game id:"
    game_id = gets.chomp
    params = {}
    print "Name of Game:"
    params["input_name"] = gets.chomp
    print "Price:"
    params["input_price"] = gets.chomp
    # print "Image Url:"
    # params["input_image_url"] = gets.chomp
    print "Description:"
    params["input_description"] = gets.chomp
    params.delete_if { |_key, value| value.empty? }

    response = Unirest.patch("http://localhost:3000/v2/games/#{game_id}", parameters:params)
    game = response.body
    puts JSON.pretty_generate(game)

  elsif input_word == "4"
    print "Enter game Id :"
    game_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/v2/games/#{game_id}")
    body = response.body
    puts JSON.pretty_generate(body)

  elsif input_word == "signup"
    params = {}
    print "Enter Name:"
    params["name"]=gets.chomp
    print "Enter email address:"
    params["email"]=gets.chomp
    print "password :"
    params["password"]=gets.chomp
    print "Confirm password :"
    params["password_confirmation"] = gets.chomp


    response = Unirest.post("http://localhost:3000/v2/user", parameters: params)
    p response.body 

  elsif input_word == "logout"
    jwt = ""
    Unirest.clear_default_headers()

  elsif input_word == "order"

    response = Unirest.post("http://localhost:3000/v2/orders")
    order = response.body
    puts JSON.pretty_generate(order)

  elsif input_word == "5"
    response=Unirest.get("http://localhost:3000/v2/orders")
    orders=response.body
    puts JSON.pretty_generate(orders)

  elsif input_word == "6"
    params = {}
    print "Enter Category ID :"
    params["category_id"] = gets.chomp
    response = Unirest.get("http://localhost:3000/v2/categories", parameters:params)
    category = response.body
    puts JSON.pretty_generate(category)
 elsif input_word == "7"
   params = {}
   print "Enter Game ID :"
   params["game_id"] = gets.chomp
   print "Enter quantity to purchase :"
   params["quantity"] = gets.chomp
   response = Unirest.post("http://localhost:3000/v2/cart", parameters:params)
   carted_game = response.body
   puts JSON.pretty_generate(carted_game)

 elsif input_word == "8"
   response=Unirest.get("http://localhost:3000/v2/cart")
   cart=response.body
   puts JSON.pretty_generate(cart)
elsif input_word == "9"
  print "Enter carted product id to remove: "
  input_carted_game_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/v2/cart/#{input_carted_game_id}")
  message = response.body
  puts JSON.pretty_generate(message)
  
  end

  puts "press [q] to quit"
  puts "press any other key to continue"
  input_key=gets.chomp
  if input_key == "q"
    break
  end
    
end
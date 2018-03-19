require "unirest"

while true

  system"clear"

  puts "Welcome to my Gaming store"
  puts "To view all games enter [all]"
  puts "To search by name press [search]"
  puts "To view Individual Games enter [1]"
  puts "To add a new game to our ever growing collection enter [2]"
  puts "To edit a game entry press 3"
  puts "To remove a game entry press 4"
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
    response = Unirest.delete("http://localhost:3000/v2/game/#{game_id}")
    body = response.body
    puts JSON.pretty_generate(body)


  end

  puts "press [q] to quit"
  puts "press any other key to continue"
  input_key=gets.chomp
  if input_key == "q"
    break
  end
    
end
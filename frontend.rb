require "unirest"

while true

  system"clear"

  puts "Welcome to my Gaming store"
  puts "To view all games enter [all]"
  puts "To view Individual Games enter [1]"
  puts "To add a new game to our ever growing collection enter [2]"
  input_word=gets.chomp 

  if input_word == "all"
    response=Unirest.get("http://localhost:3000/v2/games")
    game=response.body
    puts JSON.pretty_generate(game)

  elsif input_word == "1"
    puts "Enter game id:"
    game_id = gets.chomp
    response=Unirest.get("http://localhost:3000/v2/game/#{game_id}")
    game=response.body
    puts JSON.pretty_generate(game)
  elsif input_word == "2"
    params = { "input_name" => "Legend of Zeld",
      "input_price" => 60, 
      "input_image_url" => "",
      "input_description" => "action,rpg"
     }
    response = Unirest.post("http://localhost:3000/v2/games", parameters: params)
    game= response.body
    puts JSON.pretty_generate(game)
  end

  puts "press [q] to quit"
  puts "press any other key to continue"
  input_key=gets.chomp
  if input_key == "q"
    break
  end
    
end
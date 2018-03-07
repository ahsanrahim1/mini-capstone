require "unirest"

while true

  system"clear"

  puts "Welcome to my Gaming store"
  puts "To view all games enter [all]"
  puts "To view Individual Games"
  puts "[1], for Fifa 18"
  puts "[2]. for Mortal Kombat X"
  input_word=gets.chomp 

  if input_word == "all"
    response=Unirest.get("http://localhost:3000/games_url")
    game=response.body
    puts JSON.pretty_generate(game)

  elsif input_word == "1"
    response=Unirest.get("http://localhost:3000/fifa_18")
    game=response.body
    puts JSON.pretty_generate(game)
  elsif input_word == "2"
    response=Unirest.get("http://localhost:3000/mkombat_x")
    game=response.body
    puts JSON.pretty_generate(game)
  end

  puts "press [q] to quit"
  puts "press any other key to continue"
  input_key=gets.chomp
  if input_key == "q"
    break
  end
end
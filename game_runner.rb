require_relative("./board")
require_relative("./game")
require_relative("./ships")
require("pry-byebug")

class GameRunner

def initialize(game)
  @game=game


end

def game_intro()
  @players =[]
  puts "Welcome to Battleships!  Please enter your name Commander:"
  player_1_name = gets.chomp
  @game.players[0][:name] = player_1_name
  puts "Thanks Commander #{player_1_name}."
  puts "Commander 2, please enter your name:"
  player_2_name = gets.chomp
  @game.players[1][:name] = player_2_name
  puts "Commanders, prepare for battle!"
end

def ask_for_guess()
  puts "Commander #{@game.current_player[:name]} please enter your grid reference (between A1 - D5)"
  guess = gets.chomp
  @game.current_player[:guess] = guess
end

def run_game()
  game_intro()

  while (true) do
    ask_for_guess()
    result = @game.shot_fired
    if result
      puts "Woo! You hit the other player's ship!"
      puts "Congratulations Commander #{@game.current_player[:name]} you rule the waves!!"
      break
    else 
      puts "Uh -oh - you missed. The battle continues!"
    end
    @game.change_current_player
  end

 
end
end

gameboard = GameBoard.new
ships = Ships.new
game = Game.new("DummyName1","DummyName2", "DummyGuess1", "DummyGuess2", gameboard, ships)
runner = GameRunner.new(game)
runner.run_game()
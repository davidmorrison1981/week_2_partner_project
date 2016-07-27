require("pry-byebug")

class Game

  attr_reader :players, :board

  def initialize (player_1_name, player_2_name, player_1_guess, player_2_guess, board, ships)
    @players=[
      {name: player_1_name, guess: player_1_guess},
      {name:player_2_name, guess:player_2_guess}
    ]

    @current_player_index = 0
    @board = board
    @ships = ships
  end

  def gameboard()
    position=@board.board[:A][1]
    return position
  end

  def current_player
    return @players[@current_player_index]
  end

  def other_player_index
    (@current_player_index + 1) % players.length
  end
  def change_current_player
    @current_player_index = (@current_player_index +1) % players.length
  end

  def shot_fired()
    hit = false
  
    for ship_part in @ships.ships[other_player_index][:destroyer]

      if ship_part == current_player[:guess]
        hit = true 
      end
    end
        
    return hit
  
  end

  def winner()
    for player in @players 
      return player if shot_fired()==true
    end
    return false
  end

end

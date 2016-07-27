require("minitest/autorun")
require("pry-byebug")
require_relative("../game")
require_relative("../board")
require_relative("../ships")
require("minitest/rg")

class GameTest <MiniTest::Test

  def setup
    @board = GameBoard.new
    @ships=Ships.new
    @game=Game.new("Emma", "David", "A1", "D5", @board, @ships)

  end

  def test_players_exist
    assert_equal([{
      name: "Emma", guess: "A1"},
      {name: "David", guess: "D5"}], @game.players)
  end

  def test_board_works
    assert_equal( "A2", @game.gameboard)
  end

  def test_can_change_current_player
    @game.change_current_player()
    assert_equal({name:"David", guess: "D5"}, @game.current_player)
  end

  def test_can_hit_a_ship
    @game.shot_fired()
    assert_equal(true, @game.shot_fired)
  end


  def test_missed_shot
    @game.change_current_player
    @game.shot_fired()
    assert_equal(false, @game.shot_fired)
  end


  # def test_missed_shot
  #   @game.shot_fired("C6")
  #   assert_equal(false, @game.shot_fired)
  # end



end
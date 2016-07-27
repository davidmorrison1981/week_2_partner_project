class GameBoard

  attr_reader(:board)

  def initialize
    @board = {
      A: ["A1", "A2", "A3", "A4", "A5"],
      B: [1, 2, 3, 4, 5],
      C: [1, 2, 3, 4, 5],
      D: [1, 2, 3, 4, 5],
      E: [1, 2, 3, 4, 5]
      }
  end

end
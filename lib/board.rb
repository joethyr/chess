class Board
  attr_reader :grid

  def initialize
    @grid = [
      ['x', 'x', 'x', 'x'],
      ['x', 'x', 'x', 'x'],
      ['x', 'x', 'x', 'x'],
      ['x', 'x', 'x', 'x']
    ]
  end

  # sets the piece on the grid with use of coordinate
  def []=(coordinate, piece)
    row, column = coordinate
    grid[row][column] = piece
  end
end

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

  # gets the grid position value with use of coordinate
  def [](coordinate)
    row, column = coordinate
    grid[row][column]
  end
end

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

  # checks if coordinate is within bounds
  def within_bounds?(coordinate)
    row, column = coordinate

    row < grid.length &&
      column < grid[0].length &&
      row >= 0 &&
      column >= 0
  end
end

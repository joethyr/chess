class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def self.setup_pieces
    board = new
    8.times do |col|
      board[[1, col]] = Pawn.new(:black)
      board[[6, col]] = Pawn.new(:white)
    end
    [[0, :black], [7, :white]].each do |row, color|
      board[[row, 0]] = Rook.new(color)
      board[[row, 7]] = Rook.new(color)
      board[[row, 1]] = Knight.new(color)
      board[[row, 6]] = Knight.new(color)
      board[[row, 2]] = Bishop.new(color)
      board[[row, 5]] = Bishop.new(color)
    end
    board[[0, 3]] = King.new(:black)
    board[[7, 3]] = King.new(:white)
    board[[0, 4]] = Queen.new(:black)
    board[[7, 4]] = Queen.new(:white)

    board
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

  def empty?(coordinate)
    row, column = coordinate
    grid[row][column].nil?
  end
end

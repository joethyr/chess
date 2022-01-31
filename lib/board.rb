class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def self.setup_pieces
    board = new
    8.times do |col|
      board[[1, col]] = Pawn.new(board, :black, [1, col])
      board[[6, col]] = Pawn.new(board, :white, [6, col])
    end
    [[0, :black], [7, :white]].each do |row, color|
      board[[row, 0]] = Rook.new(board, color, [row, 0])
      board[[row, 7]] = Rook.new(board, color, [row, 7])
      board[[row, 1]] = Knight.new(board, color, [row, 1])
      board[[row, 6]] = Knight.new(board, color, [row, 6])
      board[[row, 2]] = Bishop.new(board, color, [row, 2])
      board[[row, 5]] = Bishop.new(board, color, [row, 5])
    end
    board[[0, 3]] = King.new(board, :black, [0, 3])
    board[[7, 3]] = King.new(board, :white, [7, 3])
    board[[0, 4]] = Queen.new(board, :black, [0, 4])
    board[[7, 4]] = Queen.new(board, :white, [7, 4])

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

  def check?(color)
    king = pieces.find { |i| i.color == color && i.is_a?(King) }
    raise "No King found." if king.nil?

    king_position = king.coordinate
    pieces.select { |i| i.color != color }.each do |piece|
      return true if piece.available_moves.include?(king_position)
    end
    false
  end

  def checkmate?(color)
    return false unless check?(color)

    color_pieces = pieces.select { |i| i.color == color}
    color_pieces.any? { |piece| piece.safe_moves.empty?}
  end

  def pieces
    grid.flatten.reject { |piece| piece.nil? }
  end

  def empty?(coordinate)
    row, column = coordinate
    grid[row][column].nil?
  end

  def move_piece(start_position, end_position)
    # validate that 'end_position is in available moves'
    piece = self[start_position]
    unless piece.safe_moves.include?(end_position)
      raise InvalidMoveError.new("Position #{end_position} is not an available move.")
    end
    # validate that 'end_position is within board bounds.'
    raise InvalidMoveError.new('Position not within board bounds.') unless within_bounds?(end_position)

    move_piece!(start_position, end_position)
  end

  def move_piece!(start_position, end_position)
    # remove piece from the board at the start position
    # place the piece on the board at the new location
    self[start_position], self[end_position] = nil, self[start_position]
    # update the piece's internal location with end position
    self[end_position].coordinate = end_position
  end

  def duplicate
    new_board = Board.new
    pieces.each do |piece|
      new_piece = piece.class.new(new_board, piece.color, piece.coordinate)
      new_board[new_piece.coordinate] = new_piece
    end
    new_board
  end
end

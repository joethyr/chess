class Piece
  attr_reader :board, :color
  attr_accessor :coordinate

  def initialize(board, color, coordinate)
    @board = board
    @color = color
    @coordinate = coordinate
  end

  def opponent?(coordinate)
    !board[coordinate].nil? && board[coordinate].color != color
  end

  def current_row
    coordinate.first
  end

  def current_column
    coordinate.last
  end

  def safe_moves
    moves = []
    available_moves.each do |move|
      new_board = board.duplicate
      new_board.move_piece(coordinate, move)
      moves << move unless new_board.check?(color)
    end
    moves
  end
end

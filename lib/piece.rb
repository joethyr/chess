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
end

  def move_piece(start_position, end_position)
    # validate that 'end_position is in available moves'
    piece = self[start_position]
    unless piece.available_moves.include?(end_position)
      raise "End position #{end_position} is not an available move."
    end

    # validate that 'end_position is within board bounds.'
    raise 'End position not within board bounds.' unless within_bounds?(end_position)

    # remove piece from the board at the start position
    self[start_position] = nil

    # place the piece on the board at the new location
    self[end_position] = piece

    # update the piece's internal location with end position
    piece.coordinate = end_position
  end

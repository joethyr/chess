class Piece
  attr_reader :board, :color, :coordinate

  def initialize(board, color, coordinate)
    @board = board
    @color = color
    @coordinate = coordinate
  end

  def opponent?(coordinate)
    !board[coordinate].nil? && board[coordinate].color != color
  end
end

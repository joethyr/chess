class Piece
  attr_reader :color, :board, :coordinate

  def initialize(board, color, coordinate)
    @board = board
    @color = color
    @coordinate = coordinate
  end

  def opponent?(coordinate)
    !board[coordinate].nil? && board[coordinate].color != color
  end
end

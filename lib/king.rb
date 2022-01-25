class King < Piece

  def to_s
    color == :white ? '♔' : '♚'
  end

  def move_directions
    [
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0],
      [-1, -1],
      [-1, 1],
      [1, 1],
      [1, -1]
    ]
  end
end

# pice move
# one square in any direction, as long as the square is not attacked by an enemy piece

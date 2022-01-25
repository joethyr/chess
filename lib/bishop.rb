class Bishop < Piece

  def to_s
    color == :white ? '♗' : '♝'
  end

  def move_directions
    [
      [1, 1],
      [1, -1],
      [-1, -1],
      [-1, 1]
    ]
  end
end

# piece move
# move diagonally any number of squares
# unable to jump over pieces

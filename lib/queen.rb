class Queen < Piece
  include Slidable

  def to_s
    color == :white ? '♕' : '♛'
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

# piece moves0
# move diagonally, vertically, or horizontally any number of squares.
# unable to jump over pieces

class Queen
  attr_reader :color

  def initialize(color)
    @color = color
  end

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

# piece moves
# move diagonally, vertically, or horizontally any number of squares.
# unable to jump over pieces

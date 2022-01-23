class Knight
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def to_s
    color == :white ? '♘' : '♞'
  end

  def move_directions
    [
      [-2, 1],
      [-2, -1],
      [2, -1],
      [2, 1],
      [-1, 2],
      [-1, -2],
      [1,  2],
      [1, -2]
    ]
  end
end

# piece move
# move in a L shape (two squares horizontal/vertical and one square vertical/horizontal)
# can jump over other pieces

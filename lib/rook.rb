class Rook
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def move_directions
    [
      [0, 1],
      [0, -1],
      [1, 0],
      [-1, 0]
    ]
  end
end

# move piece
# move horizontally or vertically any number of squares
# unable to jump over pieces
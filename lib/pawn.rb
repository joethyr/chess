class Pawn
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def to_s
    color == :white ? '♙' : '♟'
  end

  def move_directions
    [
      [0, 1]
    ]
  end

  def starting_move
    if row == 1 || row == 7
    end
  end
end

# piece movement
# can move two squares if they have not initially moved yet
# vertically foward (not backwards) one square.
# pawns capture pieces differently
# they capture one square diagonally in a forward direction
# once they reach other side of the board they promote to any other piece except king.

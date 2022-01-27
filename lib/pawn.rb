class Pawn < Piece
  include Stepable

# piece movement
# can move two squares if they have not initially moved yet
# vertically foward (not backwards) one square.
# pawns capture pieces differently
# they capture one square diagonally in a forward direction
# once they reach other side of the board they promote to any other piece except king.

  def start_point?
    color == :black && current_row == 1 || color == :white && current_row == 6
  end

  def forward_direction
    color == :black ? 1 : -1
  end

  def available_moves
    moves = []

    if board[]
  end

  def to_s
    color == :white ? '♙' : '♟'
  end

  def move_directions
    [
      [0, 1]
    ]
  end
end

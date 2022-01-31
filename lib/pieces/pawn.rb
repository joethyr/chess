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

    move_foward(moves)
    move_diagonal(moves)
  end

  def move_foward(moves)
    # move forward 1
    one_forward = [current_row + forward_direction, current_column]
    moves << one_forward if board.empty?(one_forward)

    # if on the start line, move forward 2
    two_forward = [current_row + (forward_direction * 2), current_column]
    moves << two_forward if board.empty?(two_forward) && board.empty?(one_forward) && start_point?
  end

  def move_diagonal(moves)
    diagonal_left = [current_row + forward_direction, current_column + 1]
    diagonal_right = [current_row + forward_direction, current_column - 1]
    moves << diagonal_left if opponent?(diagonal_left)

    moves << diagonal_right if opponent?(diagonal_right)

    moves.select { |coord| board.within_bounds?(coord) }
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

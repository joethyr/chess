module Stepable
  def available_moves
    moves = []

    move_directions.each do |x, y|
      row, column = coordinate

      row += x
      column += y
      coord = [row, column]
      next unless board.within_bounds?(coord)

      moves << coord if board.empty?(coord) || opponent?(coord)
    end
    moves
  end
end

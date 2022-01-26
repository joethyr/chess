module Movable

  def slide_move
    moves = []

    move_directions.each do |x, y|
      row, column = coordinate

      loop do
        row += x
        column += y
        coord = [row, column]
        break unless board.within_bounds?(coord)

        moves << coord if board.empty?(coord)
        if opponent?(coord)
          moves << coord
          break
        end
      end
    end
    moves
  end
end

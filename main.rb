require_relative './lib/board'

board = Board.new
puts board.within_bounds?([-1, 0])
puts board.within_bounds?([1, 0])
puts board.within_bounds?([1, 1])
puts board.within_bounds?([5, 5])

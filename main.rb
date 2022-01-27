require_relative './lib/pieces'
require_relative './lib/board'
require_relative './lib/board_render_text'
require_relative './lib/player'

b = Board.setup_pieces
display = BoardRenderText.new(b)

b[[2, 2]] = Pawn.new(b, :white, [2, 2])
b[[2, 0]] = Pawn.new(b, :white, [2, 0])
p b[[1, 1]].available_moves
puts display.render

# b = Board.setup_pieces
# display = BoardRenderText.new(b)
# puts display.render

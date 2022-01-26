require_relative './lib/pieces'
require_relative './lib/board'
require_relative './lib/board_render_text'
require_relative './lib/player'

b = Board.new
b[[0, 0]] = Rook.new(b, :black, [0, 0])
p b[[0, 0]].slide_move

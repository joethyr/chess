require_relative './lib/board'
require_relative './lib/board_render_text'
require_relative './lib/bishop'
require_relative './lib/king'
require_relative './lib/knight'
require_relative './lib/pawn'
require_relative './lib/player'
require_relative './lib/queen'
require_relative './lib/rook'

board = Board.setup_pieces

text_board = BoardRenderText.new(board)
puts text_board.render

require_relative './lib/pieces'
require_relative './lib/board'
require_relative './lib/board_render_text'
require_relative './lib/player'
require_relative './lib/game'

game = Game.new
game.play

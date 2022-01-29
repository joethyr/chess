require_relative './lib/pieces'
require_relative './lib/board'
require_relative './lib/board_render'
require_relative './lib/player'
require_relative './lib/game'

game = Game.new(Player.new(:black), Player.new(:white))
game.play
# renderer = BoardRender.new(board)
# renderer.render

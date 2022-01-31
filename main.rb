require_relative './lib/pieces'
require_relative './lib/board'
require_relative './lib/board_render'
require_relative './lib/player'
require_relative './lib/game'
require_relative './lib/invalid_move_error'

game = Game.new(Player.new(:black), Player.new(:white))
game.play

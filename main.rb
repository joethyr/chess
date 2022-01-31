require_relative './lib/pieces'
require_relative './lib/board'
require_relative './lib/board_render'
require_relative './lib/player'
require_relative './lib/game'
require_relative './lib/invalid_move_error'


b = Board.new
b[[0, 0]] = King.new(b, :black, [0, 0])
b[[6, 6]] = King.new(b, :white, [6, 6])

b[[3, 0]] = Rook.new(b, :white, [3, 0])
b[[3, 1]] = Rook.new(b, :white, [3, 1])

# puts b.checkmate?(:white)

game = Game.new(Player.new(:black), Player.new(:white))
game.play

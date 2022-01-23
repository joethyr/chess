require_relative './lib/board'
require_relative './lib/pawn'
require_relative './lib/rook'

pawn = Pawn.new([0, 0], :white)
p pawn.to_s
pawn = Pawn.new([0, 0], :black)
p pawn.to_s

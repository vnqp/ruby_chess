require_relative './lib/board.rb'
require_relative './lib/pieces/pawn.rb'
require_relative './lib/pieces/rook.rb'

b = Board.new


b.place_piece([0, 0], Pawn.new([0, 0], :black))
b.place_piece([1, 1], Pawn.new([0, 0], :black))
b.place_piece([1, 2], Pawn.new([0, 0], :black))

puts b.grid
pawn = Pawn.new([0, 0], :white)

p pawn.to_s
require_relative './lib/board'
require_relative './lib/rendered_board'
require_relative './lib/pieces'

b = Board.set_pieces
rendered_board = RenderedBoard.new(b)
puts rendered_board.render

b.place_piece([2, 2], Pawn.new(b, [2, 2], :white))
b.place_piece([2, 0], Pawn.new(b, [2, 2], :white))

puts rendered_board.render


p b.show_piece([1, 1]).possible_moves
b.move_piece([1, 1], [4, 4])
puts rendered_board.render
# b.place_piece([0, 0], King.new(b, [0, 0], :black))
# piece = b.show_piece([0, 0])
# p piece.possible_moves
# b.place_piece([0, 1], Pawn.new(b, [0, 1], :white))


# puts piece.enemy?([0, 1])
# puts piece.enemy?([0, 0])

# rendered_board = RenderedBoard.new(b)
# puts rendered_board.render


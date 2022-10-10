require_relative './lib/invalid_move_error'
require_relative './lib/board'
require_relative './lib/rendered_board'
require_relative './lib/pieces'
require_relative './lib/player'
require_relative './lib/game'

# b = Board.new
# b.place_piece([1, 1], King.new(b, [1, 1], :black))

# b.place_piece([6, 6], King.new(b, [6, 6], :white))
# b.place_piece([3, 2], Rook.new(b, [3, 2], :white))
# b.place_piece([4, 2], Rook.new(b, [4, 2], :white))
# puts b.in_check?(:black)
# puts b.in_check?(:white)

b = Board.set_pieces
r = RenderedBoard
g = Game.new(b, r, Player.new(:white), Player.new(:black))
g.play

# b = Board.set_pieces
# rendered_board = RenderedBoard.new(b)
# puts rendered_board.render

# b.place_piece([2, 2], Pawn.new(b, [2, 2], :white))
# b.place_piece([2, 0], Pawn.new(b, [2, 2], :white))

# puts rendered_board.render


# p b.show_piece([1, 1]).possible_moves
# b.move_piece([1, 1], [4, 4])
# puts rendered_board.render
# b.place_piece([0, 0], King.new(b, [0, 0], :black))
# piece = b.show_piece([0, 0])
# p piece.possible_moves
# b.place_piece([0, 1], Pawn.new(b, [0, 1], :white))


# puts piece.enemy?([0, 1])
# puts piece.enemy?([0, 0])

# rendered_board = RenderedBoard.new(b)
# puts rendered_board.render


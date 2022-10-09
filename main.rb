require_relative './lib/board'
require_relative './lib/rendered_board'
require_relative './lib/pieces/bishop'
require_relative './lib/pieces/king'
require_relative './lib/pieces/knight'
require_relative './lib/pieces/queen'
require_relative './lib/pieces/pawn'
require_relative './lib/pieces/rook'

b = Board.set_pieces

rendered_board = RenderedBoard.new(b)
puts rendered_board.render

pawn = Pawn.new(:white)

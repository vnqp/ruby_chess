require_relative './pieces/bishop'
require_relative './pieces/king'
require_relative './pieces/knight'
require_relative './pieces/queen'
require_relative './pieces/pawn'
require_relative './pieces/rook'

class Board
  attr_reader :grid

  def self.set_pieces
    board = self.new

    # create pawns
    8.times do |column|
      board.place_piece([6, column], Pawn.new(:white))
      board.place_piece([1, column], Pawn.new(:black))
    end

    # create rooks
    board.place_piece([7, 0], Rook.new(:white))
    board.place_piece([7, 7], Rook.new(:white))
    board.place_piece([0, 0], Rook.new(:black))
    board.place_piece([0, 7], Rook.new(:black))
    
    # create knights
    board.place_piece([7, 1], Knight.new(:white))
    board.place_piece([7, 6], Knight.new(:white))
    board.place_piece([0, 1], Knight.new(:black))
    board.place_piece([0, 6], Knight.new(:black))
    
    # create bishops
    board.place_piece([7, 2], Bishop.new(:white))
    board.place_piece([7, 5], Bishop.new(:white))
    board.place_piece([0, 2], Bishop.new(:black))
    board.place_piece([0, 5], Bishop.new(:black))
    
    # create kings
    board.place_piece([7, 3], King.new(:white))
    board.place_piece([0, 3], King.new(:black))

    # create queens
    board.place_piece([7, 4], Queen.new(:white))
    board.place_piece([0, 4], Queen.new(:black))

    board
  end

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def place_piece(location, piece)
    row, column = location
    grid[row][column] = piece
  end

  def show_piece(location)
    row, column = location
    grid[row][column]
  end

  def in_bounds?(location)
    row, column = location

    row < grid.first.length && 
    column < grid.first.length && 
    row >= 0 && 
    column >= 0 
  end
end
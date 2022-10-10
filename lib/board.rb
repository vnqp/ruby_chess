require_relative './pieces'

class Board
  attr_reader :grid

  def self.set_pieces
    board = self.new

    # create pawns
    8.times do |column|
      board.place_piece([6, column], Pawn.new(board, [6, column], :white))
      board.place_piece([1, column], Pawn.new(board, [1, column], :black))
    end
    # create rooks
    board.place_piece([7, 0], Rook.new(board, [7, 0], :white))
    board.place_piece([7, 7], Rook.new(board, [7, 7], :white))
    board.place_piece([0, 0], Rook.new(board, [0, 0], :black))
    board.place_piece([0, 7], Rook.new(board, [0, 7], :black))
    # create knights
    board.place_piece([7, 1], Knight.new(board, [7, 1], :white))
    board.place_piece([7, 6], Knight.new(board, [7, 6], :white))
    board.place_piece([0, 1], Knight.new(board, [0, 1], :black))
    board.place_piece([0, 6], Knight.new(board, [0, 6], :black))
    # create bishops
    board.place_piece([7, 2], Bishop.new(board, [7, 2], :white))
    board.place_piece([7, 5], Bishop.new(board, [7, 5], :white))
    board.place_piece([0, 2], Bishop.new(board, [0, 2], :black))
    board.place_piece([0, 5], Bishop.new(board, [0, 5], :black))
    # create kings
    board.place_piece([7, 3], King.new(board, [7, 3], :white))
    board.place_piece([0, 3], King.new(board, [0, 3], :black))
    # create queens
    board.place_piece([7, 4], Queen.new(board, [7, 4], :white))
    board.place_piece([0, 4], Queen.new(board, [0, 4], :black))

    board
  end

  def initialize
    @grid = Array.new(8) { Array.new(8, NullPiece.instance) }
  end

  def place_piece(location, piece)
    row, column = location
    grid[row][column] = piece
  end

  def show_piece(location)
    row, column = location
    grid[row][column]
  end

  def empty?(location)
    row, column = location
    grid[row][column] == NullPiece.instance
  end

  def in_bounds?(location)
    row, column = location

    row < grid.first.length && 
    column < grid.first.length && 
    row >= 0 && 
    column >= 0 
  end

  def in_check?(color)
    king = pieces
    .find { |p| p.color == color && p.is_a?(King) }

    raise 'King not found' if king.nil?
    king_location = king.location
    
    pieces.select { |p| p.color != color }.each do |piece|
      return true if piece.possible_moves.include?(king_location)

    end

    false
  end

  def checkmate?(color)
    return false if !in_check?(color)
    color_pieces = pieces.select { |p| p.color == color}
    color_pieces.all? { |piece| piece.safe_moves.empty? }
  end

  def pieces
    grid.flatten.reject { |piece| piece.is_a?(NullPiece)}
  end

  def move_piece(start_location, end_location)
    piece = self.show_piece(start_location)
    # validate that end location is a valid move
    if !piece.safe_moves.include?(end_location)
      raise InvalidMoveError.new(
      "#{end_location} position not available, available positions: #{piece.safe_moves}"
      )
    end
    if !in_bounds?(end_location)
      raise InvalidMoveError.new (
      "position not in bounds, available positions: #{piece.safe_moves}"
      )
    end

    move_piece!(start_location, end_location)
  end

  def move_piece!(start_location, end_location)
    piece = self.show_piece(start_location)
    self.place_piece(start_location, NullPiece.instance)
    self.place_piece(end_location, piece)
    self.show_piece(end_location).location = end_location
  end

  def dup
    new_board = Board.new
    pieces.each do |piece|
      new_piece = piece.class.new(new_board, piece.location, piece.color)
      new_board.place_piece(new_piece.location, new_piece) 
    end

    new_board
  end
end
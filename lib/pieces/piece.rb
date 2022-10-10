class Piece
  attr_reader :color, :board
  attr_accessor :location

  def initialize(board, location, color)
    @board = board
    @location = location
    @color = color
  end

  # Available moves that don't move us into check
  def safe_moves
    moves = []
    possible_moves.each do |move|
      # duplicate board
      new_board = board.dup
      
      # try move
      new_board.move_piece!(location, move)

      # if not in check, then the move is valid
       !new_board.in_check?(color) ? moves << move : nil
  end

    moves
  end

  def enemy?(location)
    !board.empty?(location) && board.in_bounds?(location) && board.show_piece(location).color != color
  end

  def ally?(location)
    board.show_piece(location).color == color
  end
end
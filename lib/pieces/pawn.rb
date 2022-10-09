class Pawn < Piece
  def forward_direction
    color == :white ? -1 : 1
  end

  def at_start?
    row, column = location

    return true if color == :white && row == 6
    return true if color == :black && row == 1

    false
  end

  def possible_moves
    moves = []
    current_row, current_column = location
    
    # step 1 place forward
    one_forward = [current_row + forward_direction, current_column]
    board.empty?(one_forward) ? moves << one_forward : nil

    # step 2 places forward
    two_forward = [current_row + forward_direction * 2, current_column]
    if board.empty?(two_forward) && board.empty?(one_forward) && 
    at_start?
      moves << two_forward
    end

    # if there's an enemy at a diagonal
    left_diag = [current_row + forward_direction, current_column + 1]
    right_diag = [current_row + forward_direction, current_column - 1]
    enemy?(left_diag) ? moves << left_diag : nil
    enemy?(right_diag) ? moves << right_diag : nil

    moves.select { |move| board.in_bounds?(move) }
  end

  # override to_s method
  def to_s
    color == :white ? "♙" : "♟"
  end
end
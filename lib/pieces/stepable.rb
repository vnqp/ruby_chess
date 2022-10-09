module Stepable

  def possible_moves
    moves = []

    directions.each do |d_row, d_column|
      current_row, current_column = location
      
      # add the location + d_row, d_column to moves
      current_row += d_row
      current_column += d_column
      location = [current_row, current_column]
      next unless board.in_bounds?(location)
      
      if board.empty?(location) || enemy?(location)
        moves << location
      end
    end

    moves
  end
end
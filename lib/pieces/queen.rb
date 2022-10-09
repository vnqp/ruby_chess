class Queen < Piece
  include Slideable
  
  # override to_s method
  def to_s
    color == :white ? "♕" : "♛"
  end
  
  def directions
    [
      [0, 1], [1, 0], [0, -1], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]
    ]
  end

end
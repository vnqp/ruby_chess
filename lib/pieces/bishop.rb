class Bishop < Piece
  include Slideable
  
  # override to_s method
  def to_s
    color == :white ? "♗" : "♝"
  end
  
  def directions
    [
      [1, 1], [1, -1], [-1, 1], [-1, -1]
    ]
  end

end
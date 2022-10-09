# Rook Piece
class Rook < Piece
  include Slideable
  
  def to_s
    color == :white ? "♖" : "♜"
  end

  def directions
    [
      [0, 1], [1, 0], [0, -1], [-1, 0]
    ]
  end
end

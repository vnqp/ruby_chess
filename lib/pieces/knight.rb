class Knight < Piece
  include Stepable

  # override to_s method
  def to_s
    color == :white ? '♘' : '♞'
  end

  def directions
    [
      [1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-1, 2], [2, -1], [-2, 1]
    ]
  end
end

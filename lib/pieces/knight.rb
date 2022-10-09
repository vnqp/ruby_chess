class Knight
  attr_reader :color

  def initialize(color)
    @color = color
  end

  # override to_s method
  def to_s
    color == :white ? "♘" : "♞"
  end
  
  def possible_moves
    [
      [1, 2], [2, 1], [-1, -2], [-2, -1], [1, -2], [-1, 2], [2, -1], [-2, 1]
    ]
  end

end
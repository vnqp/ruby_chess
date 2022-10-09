class Queen
  attr_reader :color

  def initialize(color)
    @color = color
  end

  # override to_s method
  def to_s
    color == :white ? "♕" : "♛"
  end
  
  def possible_moves
    [
      [0, 1], [1, 0], [0, -1], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]
    ]
  end

end
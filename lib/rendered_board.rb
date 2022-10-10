class RenderedBoard
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def render
    8.times do |row|
      puts "---------------"
      8.times do |column|
        piece = board.show_piece([row, column])
        print "#{board.show_piece([row, column])} "
      end
      puts ""
    end
    puts "---------------"
  end
end
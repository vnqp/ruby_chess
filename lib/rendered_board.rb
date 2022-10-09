class RenderedBoard
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def render
    8.times do |row|
      puts "---------------"
      8.times do |column|
        piece = board.show_piece([row, column])
        if piece.nil?
          print "  "
        else
          print "#{board.show_piece([row, column])} "
        end
      end
      puts ""
    end
    puts "---------------"
  end
end
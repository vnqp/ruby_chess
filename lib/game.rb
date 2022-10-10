class Game
  attr_reader :player1, :player2, :board, :renderer
  attr_accessor :current_player
  
  def initialize(board, renderer_class, player1, player2)
    @board = board
    @renderer = renderer_class.new(board)
    @player1 = player1
    @player2 = player2
    @current_player = @player2
  end

  def swap_player!
    self.current_player = (current_player == player1 ? player2 : player1)
  end

  def play
    while !over?
      system("clear")
      renderer.render
      puts "It's #{current_player.color}'s turn"
      if board.in_check?(current_player.color)
        puts "#{current_player.color } is in check."
      end
      take_turn
      swap_player!
    end

    system("clear")
    swap_player!
    renderer.render
    puts "Game over! The winner is: {current_player.color}"
  end

  def over?
    board.checkmate?(current_player.color)
  end

  def take_turn
    start_location = nil
    loop do
      puts "Select a piece: "
      start_location = current_player.get_location
      p start_location

      break if board.show_piece(start_location).color == current_player.color

      puts "Did not select a #{current_player.color} piece."
    end

    loop do
      puts "Select a position to move to: "
      end_location = current_player.get_location

      begin
        board.move_piece(start_location, end_location)
        break
      rescue InvalidMoveError => e
        puts e.message
      end
      
    end
  end
end
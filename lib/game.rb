class Game
  attr_reader :player1, :player2, :board, :renderer
  attr_accessor :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.setup_pieces
    @current_player = @player1
    @renderer = BoardRender.new(board)
  end

  def switch_current_player
    self.current_player = (current_player == player1 ? player2 : player1)
  end

  def play
    renderer.render
    puts "It's color #{current_player.color}'s turn."
    loop do
      puts "Enter a piece to move:"
      start_position = get_position
      if board[start_position].color == current_player.color
        break
      end
      puts "did not select a #{current_player.color} piece."
      p start_position
    end
    puts "Enter a position to move to:"
    end_position = get_position
    p end_position
  end

  def get_position
    gets.chomp.split(',').map(&:to_i)
  end
end

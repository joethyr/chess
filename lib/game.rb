class Game
  attr_reader :player1, :player2, :board
  attr_accessor :current_player

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @current_player = @player1

  end

  def switch_current_player
    self.current_player = (current_player == player1 ? player2 : player1)
  end

  def play
    puts "It's color #{current_player.color}'s turn."
    puts "Enter a piece to move:"
    start_position = get_position
    p start_position
    puts "Enter a position to move to:"
    end_position = get_position
    p end_position
  end

  def get_position
    gets.chomp.split(',').map(&:to_i)
  end
end

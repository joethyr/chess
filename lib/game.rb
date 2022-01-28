class Game
  attr_reader :player1, :player2
  attr_accessor :current_player

  def initialize
    @player1 = Player.new(:black)
    @player2 = Player.new(:white)
    @current_player = @player1
  end

  def switch_current_player
    self.current_player = (current_player == player1 ? player2 : player1)
  end

  def play
    puts "It's color #{current_player.color}'s turn."
    # prompt player to enter a starting position
    # prompt player to enter a ending position
    # move the piece
  end
end

class Game
  attr_reader :player1, :player2

  def initialize
    @player1 = Player.new(:black)
    @player2 = Player.new(:white)
    @current_player = @player1
  end

  def play
    # prompt player to enter a starting position
    # prompt player to enter a ending position
    # move the piece
  end
end

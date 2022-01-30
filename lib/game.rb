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
    while !over?
      renderer.render
      puts "It's color #{current_player.color}'s turn."
      player_turn
      switch_current_player
    end
  end

  def over?
    false
  end

  def player_turn
    start_position = nil
    # prompt current player to enter start position
    loop do
      puts "Enter a piece to move:"
      start_position = get_position
      break if !board[start_position].nil? && board[start_position].color == current_player.color

      puts "You did not select a #{current_player.color} piece."
    end
    # prompt current player to enter end position
    loop do
      puts "Enter a position to move to:"
      end_position = get_position

      # move the piece
      begin
        board.move_piece(start_position, end_position)
        break
      rescue InvalidMoveError => e
        puts e.message
      end
    end
  end

  def get_position
    gets.chomp.split(',').map(&:to_i)
  end
end

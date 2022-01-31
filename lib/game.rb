class Game
  attr_reader :player1, :player2, :board, :renderer
  attr_accessor :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.setup_pieces
    @current_player = [player1, player2].sample
    @renderer = BoardRender.new(board)
  end

  def switch_current_player
    self.current_player = (current_player == player1 ? player2 : player1)
  end

  def introduction
    puts "Lets play a game of Chess!"
    puts "#{current_player.color} will start game."

  end

  def play
    introduction
    until over?
      renderer.render
      puts "It's color #{current_player.color}'s turn."
      player_in_check?
      player_turn
      switch_current_player
    end
    finish
  end

  def player_in_check?
    puts "#{current_player.color} is in check." if board.check?(current_player.color)
  end

  def over?
    board.checkmate?(current_player.color)
  end

  def finish
    switch_current_player
    puts "#{current_player.color} is the winner! Game Over"
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

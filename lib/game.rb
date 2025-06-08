require_relative 'player'
require_relative 'board'

class Game 
  def initialize(name1, marker1, name2, marker2)
    @board = Board.new()
    @player1 = Player.new(name1, marker1)
    @player2 = Player.new(name2, marker2)
    @current_player = @player1
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def has_won?(player)
    combinations = [ 
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
      ]
    combinations.each do |combo|
      if combo.all? { |move| @board.cell_at(move) == player.marker }
        return true
      end
    end
    return false
  end

  def draw?
    @board.full? && !has_won?(@player1) && !has_won?(@player2)
  end

  def get_move
    loop do
      puts "#{@current_player.name} (#{@current_player.marker}), enter a position (0-8): "
      position = gets.chomp.to_i
      if @board.valid_move?(position)
        return position
      else
        puts "Invalid move. Try again."
      end 
    end
  end

  def play
    loop do
      @board.display
      move = get_move
      @board.update(move, @current_player.marker)

      if has_won?(@current_player)
        @board.display
        puts "#{@current_player.name} has won!"
        break
      elsif draw?
        @board.display
        puts "It's a draw!"
        break
      end
      switch_player
    end
  end
end
# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# The Game Class controls the flow for Tic-tac-toe game.
# It handles game logic, players' turn, and checks for winning condition
class Game
  def initialize(name1, marker1, name2, marker2)
    @board = Board.new
    @player1 = Player.new(name1, marker1)
    @player2 = Player.new(name2, marker2)
    @current_player = @player1
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def won?(player)
    combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]
    combinations.each do |combo|
      return true if combo.all? { |move| @board.cell_at(move) == player.marker }
    end
    false
  end

  def draw?
    @board.full? && !won?(@player1) && !won?(@player2)
  end

  def make_move
    loop do
      puts "#{@current_player.name} (#{@current_player.marker}), enter a position (0-8): "
      position = gets.chomp.to_i
      return position if @board.valid_move?(position)

      puts 'Invalid move. Try again.'
    end
  end

  def play
    loop do
      @board.display
      move = make_move
      @board.update(move, @current_player.marker)

      if won?(@current_player)
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

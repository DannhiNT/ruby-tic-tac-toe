# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# The Game Class controls the flow for Tic-tac-toe game.
# It handles game logic, players' turn, and checks for winning condition
class Game
  def initialize(size, name1, marker1, name2, marker2)
    @size = size
    @board = Board.new(size)
    @player1 = Player.new(name1, marker1)
    @player2 = Player.new(name2, marker2)
    @current_player = @player1
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def won?(player)
    combinations = []

    (0...@size).each do |row|
      arr = Array.new(@size) { |i| @board.cell_at(row * @size + i) }
      combinations << arr
    end

    (0...@size).each do |col|
      arr = Array.new(@size) { |i| @board.cell_at(i * @size + col) }
      combinations << arr
    end

    diagonal_arr1 = Array.new(@size) { |i| @board.cell_at(i * @size + i) }
    combinations << diagonal_arr1

    diagonal_arr2 = Array.new(@size) { |i| @board.cell_at(i * @size + (@size - i - 1)) }
    combinations << diagonal_arr2

    combinations.each do |combo|
      return true if combo.all? { |move| move == player.marker }
    end
    false
  end

  def draw?
    @board.full? && !won?(@player1) && !won?(@player2)
  end

  def make_move
    loop do
      puts "#{@current_player.name} (#{@current_player.marker}), enter a position (0-#{@size * @size}): "
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

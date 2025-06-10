# frozen_string_literal: true

# The Board Class represents Tic-tac-toe game board
# It manages the game grid and displays the board,
# check if the board is full, or update the board with player marker
class Board
  def initialize(size)
    @size = size
    @grid = Array.new(size * size) { |i| i.to_s }
  end

  def display
    @grid.each_with_index do |val, i|
      print val.rjust(2)
      if (i + 1) % @size == 0
        puts
        print '---+'
        puts '----+' * (@size - 2) + '----'
      else
        print print ' | '
      end
    end
  end

  def valid_move?(position)
    position.between?(0, @size * @size - 1) && @grid[position] != 'X' && @grid[position] != 'O'
  end

  def update(position, marker)
    @grid[position] = marker
  end

  def full?
    @grid.all? { |cell| %w[X O].include?(cell) }
  end

  def cell_at(index)
    @grid[index]
  end
end

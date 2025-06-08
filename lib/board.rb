class Board
  def initialize
    @grid = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  def display
    puts ""
    puts "#{@grid[0]}  | #{@grid[1]} | #{@grid[2]}"
    puts "---+---+---"
    puts "#{@grid[3]}  | #{@grid[4]} | #{@grid[5]}"
    puts "---+---+---"
    puts "#{@grid[6]}  | #{@grid[7]} | #{@grid[8]}"
    puts ""
  end

  def valid_move?(position)
    position.between?(0, 9) && (@grid[position] != "X" && @grid[position] != "O")
  end

  def update(position, marker)
    @grid[position] = marker
  end

  def full?
    @grid.all? { |cell| cell == "X" || cell == "O" }
  end
  
  def cell_at(index) 
    @grid[index]
  end
end
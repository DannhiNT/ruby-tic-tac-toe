require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game'

def set_up
  puts "Welcome to Tic-Tac-Toe. Enter 2 players' name and markers to get started"
  print "Player 1's name: " 
  name1 = gets.chomp
  print "Player 1's marker (X or O): "
  marker1 = gets.chomp
  puts "Player 1: #{name1}, marker: #{marker1}" 
  print "Player 2's name: "
  name2 = gets.chomp
  marker2 = marker1 == "X" ? "O" : "X"
  puts "Player 2: #{name2}, marker: #{marker2}" 
  [name1, marker1, name2, marker2]
end
name1, marker1, name2, marker2 = set_up
tic_tac_toe = Game.new(name1, marker1, name2, marker2)
tic_tac_toe.play






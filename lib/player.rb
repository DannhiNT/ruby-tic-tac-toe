# frozen_string_literal: true

# The Player Class represents Tic-Tac-Toe players
# Each player has a name and a marker
class Player
  attr_accessor :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

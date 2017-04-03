require_relative 'piece'
require 'byebug'

class Board
  attr_reader :grid

  def initialize
    @grid = set_board
  end

  def set_board
    grid = Array.new(8) { Array.new(8) }
    starting_rows = [0, 1, 6, 7]
    starting_rows.each do |row|
      # debugger
      grid[row] = grid[row].map { Piece.new }
    end
    grid
  end

end

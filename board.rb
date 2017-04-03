require_relative 'piece'
require_relative 'move_error'
require 'byebug'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @grid = set_board
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    grid[x][y] = value
  end

  def set_board
    starting_rows = [0, 1, 6, 7]

    starting_rows.each do |row|
      grid[row] = grid[row].map { Piece.new }
    end

    grid
  end

  def move_piece(start_pos, end_pos)
    unless valid_move?(start_pos, end_pos)
      raise MoveError.new("Invalid move")
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = nil
    end
  end

  def valid_move?(start_pos, end_pos)
    return false unless in_board?(start_pos) && in_board?(end_pos)
    return false unless self[end_pos].nil?
    return false if self[start_pos].nil?
    true
  end

  def in_board?(pos)
    return false unless (0...8).include?(pos.first)
    return false unless (0...8).include?(pos.last)
    true
  end

end

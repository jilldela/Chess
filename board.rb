require_relative 'piece'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'
require_relative 'move_error'
require_relative 'null_piece'
require_relative 'pawn'
require 'byebug'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @grid = set_board
    # @null_piece = NullPiece.instance
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

    grid.each_with_index do |row, i|
      row.each_with_index do |col, j|
        pos = [i, j]
        case pos.first
        when 1, 6
          self[pos] = Pawn.new(self, pos) # Pawns
        when 0, 7
          case j
          when 0, 7
            self[pos] = Rook.new(self, pos) # Rooks
          when 1, 6
            self[pos] = Knight.new(self, pos) # Knights
          when 2, 5
            self[pos] = Bishop.new(self, pos) # Bishops
          when 3
            self[pos] = King.new(self, pos) # Kings
          when 4
            self[pos] = Queen.new(self, pos) # Queens
          end
        else
          self[pos] = NullPiece.instance # Nulls
        end
      end
    end

    grid
  end

  def move_piece(start_pos, end_pos)
    unless valid_move?(start_pos, end_pos)
      raise MoveError.new("Invalid move")
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = NullPiece.instance
    end
  end

  def valid_move?(start_pos, end_pos)
    return false unless in_board?(start_pos) && in_board?(end_pos)
    return false unless self[end_pos] == NullPiece.instance
    return false if self[start_pos] == NullPiece.instance
    true
  end

  def in_board?(pos)
    return false unless (0...8).include?(pos.first)
    return false unless (0...8).include?(pos.last)
    true
  end

end

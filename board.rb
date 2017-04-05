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

BACK_RANK = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
PAWNS = [Pawn] * 8

def set_board

  grid.each_with_index do |row, i|
    BACK_RANK.each_with_index do |piece_class, j|
      self[[i, j]] = piece_class.new(self, [i, j])
    end
  end

  grid
end



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
    grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        if i == 0 || i == 7
          self[[i, j]] = BACK_RANK[j].new(self, [i, j])
        elsif i == 1 || i == 6
          self[[i, j]] = PAWNS[j].new(self, [i, j])
        else
          self[[i, j]] = NullPiece.instance
        end
      end
    end

    grid
  end


  def move_piece(start_pos, end_pos)
    unless self[start_pos].moves.include?(end_pos)
      raise MoveError.new("Invalid move")
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = NullPiece.instance
    end
    self[end_pos].position = end_pos
  end

  def valid_move?(start_pos, end_pos)
    return false unless in_board?(start_pos) && in_board?(end_pos)
    return false if self[start_pos] == NullPiece.instance
    true
  end

  def in_board?(pos)
    return false unless pos.first.between?(0, 7)
    return false unless pos.last.between?(0, 7)
    true
  end

  def in_check?(color)
    potential_moves = []
    grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        if piece.color != color
          potential_moves += piece.moves
        end
      end
    end
    potential_moves.uniq.each do |move|
      piece = self[move]
      return true if piece.is_a?(King) && piece.color == color
    end
    false
  end

  def undo(start_pos, end_pos, old_piece)
    self[end_pos] = old_piece
    self[start_pos] = self[end_pos]
    self[start_pos].position = start_pos
  end

end

require_relative 'slideable'
require_relative 'stepable'

class Piece

  attr_reader :color
  attr_accessor :position

  def initialize(board, position)
    @board = board
    @position = position
    if (0..1).cover?(position.first)
      @color = :black
    elsif (6..7).cover?(position.first)
      @color = :white
    else
      @color = nil
    end
  end

  def to_s
    @symbol
  end

  def valid_moves
    potential_moves = moves
    potential_moves.select do |move|
      move_into_check?(move) == false
    end
  end

  private

  def move_into_check?(end_pos)
    start_pos = @position
    old_piece = @board[end_pos]
    @board.move_piece(@position, end_pos)
    result = @board.in_check?(@color)
    @board.undo(start_pos, end_pos, old_piece)
    result
  end


end

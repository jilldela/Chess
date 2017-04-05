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

  def moves

  end

  def move_into_check

  end


end

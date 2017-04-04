class Piece

  attr_reader :position

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



end

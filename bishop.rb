require_relative 'piece'

class Bishop < Piece
  include SlidingPiece

  def initialize(board, position)
    super(board, position)
    @symbol = (@color == :white ? ' ♗ ' : ' ♝ ')
  end

  protected

  def move_dirs
    [:diagonal]
  end

end

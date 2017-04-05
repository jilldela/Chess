require_relative 'piece'

class Rook < Piece
  include SlidingPiece

  def initialize(board, position)
    super(board, position)
    @symbol = (@color == :white ? ' ♖ ' : ' ♜ ')
  end

  protected

  def move_dirs
    [:horizontal]
  end

end

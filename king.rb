require_relative 'piece'

class King < Piece
  include SteppingPiece

  DELTAS = [
    [-1,-1],
    [-1, 0],
    [-1, 1],
    [0, -1],
    [0, 1],
    [1, -1],
    [1, 0],
    [1, 1]
  ]

  def initialize(board, position)
    super(board, position)
    @symbol = (@color == :white ? ' ♔ ' : ' ♚ ')
  end

  protected

  def move_diffs
    DELTAS
  end

end

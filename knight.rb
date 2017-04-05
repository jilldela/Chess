require_relative 'piece'

class Knight < Piece
  include SteppingPiece

  DELTAS = [
    [2, -1],
    [2, 1],
    [-2, -1],
    [-2, 1],
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2]
  ]

  def initialize(board, position)
    super(board, position)
    @symbol = (@color == :white ? ' ♘ ' : ' ♞ ')
  end

  protected

  def move_diffs
    DELTAS
  end

end

require_relative 'piece'

class Bishop < Piece
  def initialize(board, position)
    super(board, position)
    @symbol = (@color == :white ? ' ♗ ' : ' ♝ ')
  end

end

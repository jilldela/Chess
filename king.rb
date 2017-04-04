require_relative 'piece'

class King < Piece
  def initialize(board, position)
    super(board, position)
    @symbol = (@color == :white ? ' ♔ ' : ' ♚ ')
  end

end

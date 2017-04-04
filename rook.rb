require_relative 'piece'

class Rook < Piece
  def initialize(board, position)
    super(board, position)
    @symbol = (@color == :white ? ' ♖ ' : ' ♜ ')
  end

end

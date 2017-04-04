require_relative 'piece'

class Knight < Piece
  def initialize(board, position)
    super(board, position)
    @symbol = (@color == :white ? ' ♘ ' : ' ♞ ')
  end

end

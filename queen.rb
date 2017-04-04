require_relative 'piece'

class Queen < Piece
  def initialize(board, position)
    super(board, position)
    @symbol = (@color == :white ? ' ♕ ' : ' ♛ ')
  end

end

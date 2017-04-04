require_relative 'piece'

class Pawn < Piece
  def initialize(board, position)
    super(board, position)
    @symbol = (@color == :white ? '♙' : '♟')
  end

end

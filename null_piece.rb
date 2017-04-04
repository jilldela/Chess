require 'singleton'

class NullPiece < Piece
  include Singleton

  def initialize
    @color = nil
    @symbol = " "
  end

end

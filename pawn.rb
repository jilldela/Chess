require_relative 'piece'
require_relative 'null_piece'
class Pawn < Piece
  def initialize(board, position)
    super(board, position)
    @symbol = (@color == :white ? ' ♙ ' : ' ♟ ')
  end

  def moves
    moves = [one_step]
    moves += two_step
    moves.select! { |move| valid_step?(move) }
    moves + side_step
  end

  protected
  
  def valid_step?(pos)
    return true if @board[pos] == NullPiece.instance
    false
  end

  def first_move?
    return true if (@color == :white && position.first == 6) ||
                   (@color == :black && position.first == 1)
    false
  end

  def one_step
    if @color == :white
      [@position.first - 1, @position.last]
    else
      [@position.first + 1, @position.last]
    end
  end

  def two_step
    moves = []
    if first_move?
      if @color == :white
        moves << [@position.first - 2, @position.last]
      else
        moves << [@position.first + 2, @position.last]
      end
    end

    moves
  end

  def side_step
    moves = []
    if color == :white
      new_pos = [@position.first - 1, position.last - 1]
      moves << new_pos if can_attack?(new_pos)
      new_pos = [@position.first - 1, @position.last + 1]
    else
      new_pos = [@position.first + 1, position.last - 1]
      moves << new_pos if can_attack?(new_pos)
      new_pos = [@position.first + 1, @position.last + 1]
    end
    moves << new_pos if can_attack?(new_pos)
    moves
  end

  def can_attack?(new_pos)
    return false unless @board.in_board?(new_pos)
    return false if @board[new_pos].color == @color
    return false if @board[new_pos] == NullPiece.instance
    true
  end

end

module SteppingPiece

  def moves
    new_moves = []
    deltas = move_diffs
    deltas.each do |delta|
      new_move = [@position.first + delta.first, @position.last + delta.last]
      next unless @board.in_board?(new_move) && @board[new_move].color != @color
      new_moves << new_move
    end
    new_moves
  end

  protected
  
  def move_diffs

  end

end

module SlidingPiece

  HORIZONTAL_DELTAS = [
    [-1, 0],
    [0, 1],
    [0, -1],
    [1, 0]
  ]

  DIAGONAL_DELTAS = [
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1]
  ]

  def moves
    new_moves = []
    new_moves += horizontal_dirs if move_dirs.include?(:horizontal)
    new_moves += diagonal_dirs if move_dirs.include?(:diagonal)
    new_moves
  end

  def move_dirs

  end

  def horizontal_dirs
    new_moves = []
    HORIZONTAL_DELTAS.each do |delta|
      new_moves += grow_unblocked_moves_in_dir(*delta)
    end

    new_moves
  end

  def diagonal_dirs
    new_moves = []
    DIAGONAL_DELTAS.each do |delta|
      new_moves += grow_unblocked_moves_in_dir(*delta)
    end

    new_moves
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    new_moves = []
    new_move = [@position.first + dx, @position.last + dy]
    while @board.in_board?(new_move) && @board[new_move].color != @color
      break if @board[new_move].color != @color && @board[new_move] != NullPiece.instance
      new_moves << new_move
      new_move = [new_move.first + dx, new_move.last + dy]
    end

    new_moves
  end

end

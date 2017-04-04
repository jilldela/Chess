require_relative 'board'
require 'colorize'
require_relative 'cursor'
require 'byebug'

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    system "clear"
    @board.grid.each_with_index do |row, i|
      strings = []
      row.each_with_index do |col, j|
        pos = [i, j]
        piece = @board[pos]
        if pos == @cursor.cursor_pos
          strings << piece.to_s.on_red.blink
        elsif i.even? == j.even?
          strings << piece.to_s.on_white
        else
          strings << piece.to_s.on_blue
        end
      end
      puts strings.join
    end

  end


end

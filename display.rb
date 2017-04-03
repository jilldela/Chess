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
    @board.grid.each_with_index do |row, r_i|
      row_string = row.map.with_index do |piece, c_i|
        if [r_i, c_i] == @cursor.cursor_pos
          piece.to_s.green.on_black.blink
        else
          piece.to_s
        end
      end

      puts row_string.join
    end
  end

end

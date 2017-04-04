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
    @board.grid.each do |row|
      strings = row.map do |piece|
        # debugger
        if piece.position == @cursor.cursor_pos
          piece.to_s.on_red.blink
        else
          piece.to_s
        end
      end
      puts strings.join(" ")
    end

  end

end

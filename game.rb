require_relative 'display'
require_relative 'board'
require_relative 'cursor'

class Game

  attr_reader :board

  def initialize
    @board = Board.new
    @display = Display.new(@board)
  end

  def play
    while true
      @display.render
      @display.cursor.get_input
    end
  end

end

b = Board.new
d = Display.new(b)
d.render

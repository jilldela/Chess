class MoveError < RuntimeError
  def initialize(m)
    @message = m
  end
end

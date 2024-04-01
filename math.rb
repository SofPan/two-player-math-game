class Player
  attr_accessor :lives
  def initialize(name)
    @name = name
    @lives = 3
    @is_alive = true
  end
end

player1 = Player.new("player1")
player2 = Player.new("player2")

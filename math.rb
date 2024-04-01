module Helpers
  def self.random_number
    [rand(1...20), rand(1...20)]
  end
end

class Game
  include Helpers
  attr_accessor :winning_answer
  def initialize
    @current_player = "player1"
    @current_score = "player1: #{player1.lives}/3 vs. player2: #{player2.lives}/3"
    @winning_answer = 0
  end
  def generate_question
    values = Helpers.random_number
    self.winning_answer= values[0] + values[1] 
    "#{values[0]} + #{values[1]} = ?"
  end
end

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

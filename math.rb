module Helpers
  def self.random_number
    [rand(1...20), rand(1...20)]
  end
end

class Game
  include Helpers
  attr_accessor :winning_answer, :game_won
  def initialize(players)
    @current_player = players[0]
    @current_score = "player1: #{players[0].lives}/3 vs. player2: #{players[1].lives}/3"
    @winning_answer = 0
    @game_won = false
  end

  def generate_question
    values = Helpers.random_number
    self.winning_answer= values[0] + values[1] 
    "#{values[0]} + #{values[1]} = ?"
  end

  def game_loop
    puts generate_question
    until game_won
      player_answer = gets.to_i
      # For TESTING, remove later
      puts "player answer is #{player_answer}, the correct answer is #{winning_answer}"
      if player_answer == winning_answer
        self.game_won= true
      end
    end
    # For TESTING, remove later
    puts "exiting game loop"
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

game = Game.new([player1, player2])

game.game_loop
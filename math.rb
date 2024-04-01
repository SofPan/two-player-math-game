module Helpers
  def self.random_number
    [rand(1...20), rand(1...20)]
  end
end

class Game
  include Helpers
  attr_accessor :winning_answer, :game_won, :current_player, :other_player
  def initialize(players)
    @current_player = players[0]
    @other_player = players[1]
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
    round_won = false
    until game_won
      player_turn = current_player
      player_answer = gets.to_i
      # For TESTING, remove later
      is_correct = player_answer == winning_answer

      puts "#{current_player.name}'s answer is #{player_answer}, they are #{is_correct ? "right!" : "totally wrong!"}"

      self.current_player= other_player
      self.other_player= player_turn
    end
    # For TESTING, remove later
    puts "exiting game loop"
  end
end

class Player
  attr_accessor :lives, :name
  def initialize(name)
    @name = name
    @lives = 3
    @is_alive = true
  end

  def lose_a_life
    @lives -= 1
  end
end

player1 = Player.new("player1")
player2 = Player.new("player2")

game = Game.new([player1, player2])

game.game_loop
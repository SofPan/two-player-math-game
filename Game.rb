require './Helpers.module.rb'

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
    current_question = generate_question
    until game_won
      puts "It is #{current_player.name}'s turn. " + current_question
      player_turn = current_player

      player_answer = gets.chomp.to_i

      is_correct = player_answer == winning_answer

      puts "#{current_player.name}'s answer is #{player_answer}, they are #{is_correct ? "right!" : "totally wrong!"}"

      !is_correct ? current_player.lose_a_life : current_question = self.generate_question
      
      current_player.lives < 1 && self.game_won = true

      self.current_player= other_player
      self.other_player= player_turn
    end
    puts "#{current_player.name} has won, their score is #{current_player.lives}"
  end

end
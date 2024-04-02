# require 'active_support/all'

require './Game'
require './Player'


player1 = Player.new("player1")
player2 = Player.new("player2")

game = Game.new([player1, player2])

game.game_loop
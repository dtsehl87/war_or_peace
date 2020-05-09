require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game_setup'

puts "Currently there is a problem with the winner method in turn, fix that first"
game = GameSetUp.new
game.start

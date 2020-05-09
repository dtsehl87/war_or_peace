require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game_setup'
require './lib/run_game'

class RunGameTest < Minitest::Test

  def test_it_exists
    game_run = RunGame.new
    assert_instance_of RunGame, game_run
  end

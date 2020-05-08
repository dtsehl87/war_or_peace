require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game_setup'

class GameSetUpTest < Minitest::Test

  def test_it_exists
    setting_up = GameSetUp.new
    assert_instance_of GameSetUp, setting_up
  end

  def test_deck_has_52_cards
    setting_up = GameSetUp.new
    setting_up.new_deck
    assert_equal 52, setting_up.deck.count
  end

end

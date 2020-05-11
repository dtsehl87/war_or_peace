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

  def test_deck_can_exist
    setting_up = GameSetUp.new
    setting_up.new_deck

    assert_instance_of Array, setting_up.deck
  end

  def test_deck_has_52_cards
    setting_up = GameSetUp.new
    setting_up.new_deck

    assert_equal 52, setting_up.deck.count
  end

  def test_start_creates_two_decks
    setting_up = GameSetUp.new
    setting_up.start

    assert_instance_of Deck, setting_up.deck_1
    assert_instance_of Deck, setting_up.deck_2
  end

  def test_start_outputs_correct_strings_52_cards_Katie_Kelly
    setting_up = GameSetUp.new
    setting_up.start

    assert_equal "Welcome to War! (or Peace) This game will be played with 52 cards.", setting_up.start_string_1
    assert_equal "The players today are Katie and Kelly.", setting_up.start_string_2
  end

  def test_turns_can_be_played
    skip
    setting_up = GameSetUp.new
    setting_up.start

    assert_instance_of Turn, setting_up.turn
  end

end

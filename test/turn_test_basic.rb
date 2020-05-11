require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game_setup'

class TurnTestBasic < Minitest::Test

  def test_it_exists
    deck = []
    suits = %i[heart diamond spade club]
    values = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
    ranks = (2..14).to_a
    suits.each do |suit|
      values.count.times do |counter|
        deck << Card.new(suit, values[counter], ranks[counter])
      end
    end

    turn = Turn.new(@player1, @player2)

    assert_instance_of Turn, turn
  end

  def test_spoils_of_war_defaults_empty
    deck = []
    suits = %i[heart diamond spade club]
    values = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
    ranks = (2..14).to_a
    suits.each do |suit|
      values.count.times do |counter|
        deck << Card.new(suit, values[counter], ranks[counter])
      end
    end

    turn = Turn.new(@player1, @player2)

    assert_equal [], turn.spoils_of_war
  end

  def test_turn_type_can_be_basic
    deck = []
    suits = %i[heart diamond spade club]
    values = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
    ranks = (2..14).to_a
    suits.each do |suit|
      values.count.times do |counter|
        deck << Card.new(suit, values[counter], ranks[counter])
      end
    end
    deck_1 = Deck.new(deck[0..25])
    deck_2 = Deck.new(deck[25..52])
    player1 = Player.new("Megan", deck_1)
    player2 = Player.new("Aurora", deck_2)
    turn = Turn.new(player1, player2)

    assert_equal :basic, turn.type
  end

  def test_there_can_be_a_winner
    deck = []
    suits = %i[heart diamond spade club]
    values = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
    ranks = (2..14).to_a
    suits.each do |suit|
      values.count.times do |counter|
        deck << Card.new(suit, values[counter], ranks[counter])
      end
    end
    deck_1 = Deck.new(deck[0..25])
    deck_2 = Deck.new(deck[25..52])
    player1 = Player.new("Megan", deck_1)
    player2 = Player.new("Aurora", deck_2)
    turn = Turn.new(player1, player2)

    assert_equal player2, turn.winner
  end

  def test_if_cards_can_be_piled
    deck = []
    suits = %i[heart diamond spade club]
    values = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
    ranks = (2..14).to_a
    suits.each do |suit|
      values.count.times do |counter|
        deck << Card.new(suit, values[counter], ranks[counter])
      end
    end
    deck_1 = Deck.new(deck[0..25])
    deck_2 = Deck.new(deck[25..52])
    player1 = Player.new("Megan", deck_1)
    player2 = Player.new("Aurora", deck_2)
    turn = Turn.new(player1, player2)

    test_cards = [deck_1.cards[0], deck_2.cards[0]]

    turn.pile_cards

    assert_equal test_cards, turn.spoils_of_war
  end

  def test_spoils_can_be_awarded
    deck = []
    suits = %i[heart diamond spade club]
    values = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
    ranks = (2..14).to_a
    suits.each do |suit|
      values.count.times do |counter|
        deck << Card.new(suit, values[counter], ranks[counter])
      end
    end
    deck_1 = Deck.new(deck[0..25])
    deck_2 = Deck.new(deck[25..52])
    player1 = Player.new("Megan", deck_1)
    player2 = Player.new("Aurora", deck_2)
    turn = Turn.new(player1, player2)

    test_cards = [deck_1.cards[0], deck_2.cards[0]]

    turn.pile_cards

    assert_equal :basic, turn.type

    turn.award_spoils(turn.winner)

    assert_equal test_cards, player2.deck.cards.last
    assert_equal false, player1.deck.cards.include?(test_cards[0])
    assert_equal [], turn.spoils_of_war
  end

end

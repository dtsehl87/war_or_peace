require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTestMutuallyAssuredDestruction < Minitest::Test

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
    deck_1 = Deck.new(deck[0..25])
    deck_2 = Deck.new(deck[25..52])
    deck_2.cards.shift(1)
    player1 = Player.new("Megan", deck_1)
    player2 = Player.new("Aurora", deck_2)
    turn = Turn.new(player1, player2)

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
    deck_1 = Deck.new(deck[0..25])
    deck_2 = Deck.new(deck[25..52])
    deck_2.cards.shift(1)
    player1 = Player.new("Megan", deck_1)
    player2 = Player.new("Aurora", deck_2)
    turn = Turn.new(player1, player2)

    assert_equal [], turn.spoils_of_war
  end

  def test_turn_type_can_be_mad
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
    deck_2.cards.shift(1)
    player1 = Player.new("Megan", deck_1)
    player2 = Player.new("Aurora", deck_2)
    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_there_can_be_no_winner
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
    deck_2.cards.shift(1)
    player1 = Player.new("Megan", deck_1)
    player2 = Player.new("Aurora", deck_2)
    turn = Turn.new(player1, player2)

    assert_equal "No Winner", turn.winner
  end

  def test_cards_are_removed_after_being_piled
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
    deck_2.cards.shift(1)
    player1 = Player.new("Megan", deck_1)
    player2 = Player.new("Aurora", deck_2)
    turn = Turn.new(player1, player2)

    test_cards = [deck_1.cards[0..2], deck_2.cards[0..2]]

    turn.pile_cards

    assert_equal [], turn.spoils_of_war
    assert_equal false, player1.deck.cards.include?(test_cards)
    assert_equal false, player2.deck.cards.include?(test_cards)
  end

end

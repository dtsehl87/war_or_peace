require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

suits = [:heart, :diamond, :spade, :club]
values = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
ranks = (1..14).to_a
all_cards = []

suits.each do |suit|
  values.count.times do |counter|
    all_cards << Card.new( suit, values[counter], ranks[counter] )
  end
end

shuffled_cards = all_cards.shuffle
deck_1 = shuffled_cards[0..25]
deck_2 = shuffled_cards[26..52]

player1 = Player.new("Katie", deck_1)
player2 = Player.new("Kelly", deck_2)

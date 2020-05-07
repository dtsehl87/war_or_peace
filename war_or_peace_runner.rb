require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

suits = [:heart, :diamond, :spade, :club]
values = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
ranks = (1..14).to_a
cards = []

def create_cards
  suits.each do |suit|
    values.count.times do |counter|
      cards << Card.new( suit, values[counter], ranks[counter] )
    end
  end
end

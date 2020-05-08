class GameSetUp

  attr_reader :deck,
              :deck_1
              :deck_2
              :suits,
              :values,
              :ranks
              :player_1
              :player_2
  def initialize
    @deck = []
    @suits = %i[heart diamond spade club]
    @values = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
    @ranks = (2..14).to_a
  end

  def new_decks
    @suits.each do |suit|
      @values.count.times do |counter|
        @deck << Card.new(suit, @values[counter], @ranks[counter])
      end
    end
  end

end

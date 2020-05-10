class Turn

  attr_reader :player1,
              :player2,
              :spoils_of_war
              :turn_winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if (@player1.deck.cards[0].rank == @player2.deck.cards[0].rank) && (@player1.deck.cards[2].rank == @player2.deck.cards[2].rank)
      :mutually_assured_destruction
    elsif (@player1.deck.cards[0].rank == @player2.deck.cards[0].rank) && (@player1.deck.cards[2].rank != @player2.deck.cards[2].rank)
      :war
    else
      :basic
    end
  end

  def winner
    if type == :mutually_assured_destruction
      "No Winner"
    elsif (type == :war) && (@player1.deck.cards[2].rank > @player2.deck.cards[2].rank)
      @player1
    elsif (type == :war) && (@player2.deck.cards[2].rank > @player1.deck.cards[2].rank)
      @player2
    elsif (type == :basic) && (@player1.deck.cards[0].rank > @player2.deck.cards[0].rank)
      @player1
    elsif (type == :basic) && (@player2.deck.cards[0].rank > @player1.deck.cards[0].rank)
      @player2
    end
  end

  def pile_cards
    if type == :mutually_assured_destruction
      @player1.deck.remove_3_cards
      @player2.deck.remove_3_cards
    elsif type == :war
      @spoils_of_war << @player1.deck.cards[0..2]
      @spoils_of_war << @player2.deck.cards[0..2]
    else
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
    end
  end

  def award_spoils(turn_winner)
    if (turn_winner == @player1) && (type == :war)
      @player1.deck.remove_3_cards
      @player2.deck.remove_3_cards
      @player1.deck.cards << self.spoils_of_war
      @player1.deck.cards.flatten
      @spoils_of_war = []
    elsif turn_winner == @player2 && (type == :war)
      @player1.deck.remove_3_cards
      @player2.deck.remove_3_cards
      @player2.deck.cards << self.spoils_of_war
      @player2.deck.cards.flatten
      @spoils_of_war = []
    elsif (turn_winner == @player1) && (type == :basic)
      @player1.deck.remove_card
      @player2.deck.remove_card
      @player1.deck.cards << self.spoils_of_war
      @player1.deck.cards.flatten
      @spoils_of_war = []
    elsif turn_winner == @player2 && (type == :basic)
      @player1.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.cards << self.spoils_of_war
      @player2.deck.cards.flatten
      @spoils_of_war = []
    end
  end

end

class Turn

  attr_reader :player1, :player2, :spoils_of_war, :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner
  end

  def type
    if (@player1.deck.cards[0].rank == @player2.deck.cards[0].rank) && (@player1.deck.cards[2].rank == @player2.deck.cards[2].rank)
      :mutually_assured_destruction

    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      :war

    elsif @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      :basic
    end
  end

  def winner
    if type == :mutually_assured_destruction
      mad_winner = "No Winner"

    elsif type == :basic
      if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
        @player1
      elsif @player2.deck.cards[0].rank > @player1.deck.cards[0].rank
        @player2
      end

    elsif type == :war
      if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
        @player1
      elsif @player2.deck.cards[2].rank > @player1.deck.cards[2].rank
        @player2
      end

    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war.push(@player1.deck.cards[0])
      @spoils_of_war.push(@player2.deck.cards[0])
      @player1.deck.remove_card
      @player2.deck.remove_card

    elsif type == :war
      @spoils_of_war.push(@player1.deck.cards[0..2]).flatten!
      @spoils_of_war.push(@player2.deck.cards[0..2]).flatten!
        3.times do
          @player1.deck.remove_card
          @player2.deck.remove_card
        end

    elsif type == :mutually_assured_destruction
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    end
  end

  def award_spoils(turn_winner)
    turn_winner = @winner
    if turn_winner == @player1
      @player1.deck.cards.push(@spoils_of_war).flatten!
    elsif turn_winner == @player2
      @player2.deck.cards.push(@spoils_of_war).flatten!
    end
  end

end

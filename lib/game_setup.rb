class GameSetUp

  attr_reader :deck,
              :deck_1,
              :deck_2,
              :suits,
              :values,
              :ranks,
              :player1,
              :player2,
              :start_string_1,
              :start_string_2,
              :starting_pistol

  def initialize
    @deck = []
    @suits = %i[heart diamond spade club]
    @values = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
    @ranks = (2..14).to_a
  end

  def new_deck
    @suits.each do |suit|
      @values.count.times do |counter|
        @deck << Card.new(suit, @values[counter], @ranks[counter])
      end
    end
  end

  def create_two_shuffled_decks
    @deck.shuffle!
    @deck_1 = Deck.new(@deck[0..25].shuffle!)
    @deck_2 = Deck.new(@deck[25..52].shuffle!)
  end

  def assign_decks
    @player1 = Player.new("Joe", deck_1)
    @player2 = Player.new("Kelly", deck_2)
  end

  def start
    self.new_deck
    self.create_two_shuffled_decks
    self.assign_decks
    @start_string_1 = "Welcome to War! (or Peace) This game will be played with #{@deck.count} cards."
    @start_string_2 = "The players today are #{self.player1.name} and #{self.player2.name}."
    puts @start_string_1
    puts @start_string_2
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
    @starting_pistol = gets.chomp.upcase
    if @starting_pistol == "GO"
      self.play
    else
      puts "Please type GO instead."
    end
  end

  def play
    turn_counter = 1
    1000000.times do |turn|
      if turn_counter == 1000000
        puts "---- DRAW ----"
        break
      end

      turn = Turn.new(@player1, @player2)

      if @player1.has_lost? == true
        puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
        break
      elsif @player2.has_lost? == true
        puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
        break
      elsif turn.type == :mutually_assured_destruction
        turn.pile_cards
        puts "Turn #{turn_counter}: *mutually assured destruction* 6 cards removed from play"
        turn_counter += 1
      elsif turn.type == :basic
        turn.pile_cards
        puts "Turn #{turn_counter}: #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
        turn.award_spoils(turn.winner)
        turn_counter += 1
      elsif turn.type == :war
        turn.pile_cards
        puts "Turn #{turn_counter}: #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
        turn.award_spoils(turn.winner)
        turn_counter += 1
      end
    end
  end

end

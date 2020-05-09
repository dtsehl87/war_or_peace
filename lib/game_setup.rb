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
              :start_string_2
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
    @deck.shuffle
    @deck_1 = @deck[0..25]
    @deck_2 = @deck[26..52]
  end

  def assign_decks
    @player1 = Player.new("Katie", deck_1)
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
    if @starting_pistol =! "GO"
      puts "Please re-type GO and hit enter"
    else
      # code/method call to play the game starts here

  end

end

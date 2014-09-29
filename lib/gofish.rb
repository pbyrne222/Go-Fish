require 'rubycards'
include RubyCards

class StartGame
  def initialize
    @shuffled_deck = Deck.new
    @shuffled_deck.shuffle!
    puts "Thanks for playing Go Fish! Here are your first seven cards."
  end

  def hands
    @player_hand = []
    @computer_hand = []

    7.times do
      @player_hand << @shuffled_deck.draw
      @computer_hand << @shuffled_deck.draw
    end
  end

  def show_player_hand
    puts @player_hand
    puts "There are #{@shuffled_deck.count} cards remaining in the deck"    #instance variable in the string interpolation
  end
end

RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A)

class Players
  def initialize(game)
    @rank = rank
    @hand = {}
    @books = []
    @game = game
    @opponents_hand = {
      :known_to_have => [],
      :known_not_to_have => [],
    }
  end

  attr_reader :name

  def ask
    puts "Do you have any #{@rank}?"
  end


  def player_go_fish
  @player_hand << @shuffled_deck.draw
  end

  def computer_go_fish
  @computer_hand << @shuffled_deck.draw
  end



  def take_cards(cards)
    my_cards = @hand.values.flatten.concat(cards)
    @hand = my_cards.group_by {|card| card.rank}

    @hand.each do |rank, cards|
      if cards.length == 4
        puts "#@name made a book of #{@rank}"
        @books << rank
        @hand.delete(rank)
      end
    end
    if @hand.empty? and not @game.deck.empty?
      @game.deal(self, 1)
    end
  end
end


 def num_books
    @books.length
 end


  if @shuffled_deck.count = 0
    puts "Out of Cards!"
    books_evaluation
  end


  def wanted_card
      print_hand
    wanted = nil
    loop do
      print "\n Computer, do you have any...what? "
      wanted = $stdin.gets
      wanted.strip!.upcase!
      if not Card::RANKS.include?(wanted)
        puts "not a valid rank: #{wanted} -- try again."
      elsif not @hand.has_key?(wanted)
        puts "you don't have a #{wanted} -- try again"
      else
        break
      end
    end
    wanted
  end

class User < Players
  def initialize(game)
    super
    @name = "User"
  end
end

class Computer < Players
  def initialize(game)
    super
    @name = "Computer"
  end
end

class GoFishGame
  def initialize
    @shuffled_deck = Deck.new
    @players =
  end

  puts "Computer asks: Do you have any #{@rank}"
end


new_game = StartGame.new                                        #.new a new instantiation of its own class
new_game.hands
new_game.show_player_hand

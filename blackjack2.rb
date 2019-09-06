# class Card
#   include Enumerable
 
#   attr_accessor :suit, :name, :value
 
#   def initialize(suit, name, value)
#     @suit, @name, @value = suit, name, value
#   end
 
#   def to_s
#          "#{@value} of #{@suit}"
#      end
#  end
 
#  class Deck
#   attr_accessor :playable_cards
#   SUITS = [:hearts, :diamonds, :spades, :clubs]
#   NAME_VALUES = {
#     :two   => 2,
#     :three => 3,
#     :four  => 4,
#     :five  => 5,
#     :six   => 6,
#     :seven => 7,
#     :eight => 8,
#     :nine  => 9,
#     :ten   => 10,
#     :jack  => 10,
#     :queen => 10,
#     :king  => 10,
#     :ace   => [11, 1]}
 
#   def initialize
#     shuffle
#   end
 
#   def deal_card
#     random = rand(@playable_cards.size)
#     @playable_cards.delete_at(random)
#   end
 
#   def shuffle
#     @playable_cards = []
#     SUITS.each do |suit|
#       NAME_VALUES.each do |name, value|
#         @playable_cards << Card.new(suit, name, value)
#       end
#     end
#   end
#  end
 
#  class Hand
#   attr_accessor :hand
 
#   def initialize
#     @hand = []
#     @hand_value = 0
 
#     2.times do
#         card = $d.deal_card
#         @hand << card
#         @hand_value == @hand_value += card.value.to_i
#     end
#   end
 
#   def hit
#     card = $d.deal_card
#     @hand_value == 0 ? @hand_value = card.value.to_i : @hand_value += card.value.to_i
#     @hand << card
#   end
 
#   def switch_ace
#     while @hand_value > 21 && @ace_count > 0
#       @ace_count -= 1
#       @hand_value -= 10
#     end
#   end
 
#   def value
#     return @hand_value
#   end
 
#   def to_s
#     puts "hand value #{@hand_value}"
#   end
#  end
 
#  # add player class
 
#  # ---------------------------------------------
#  # NEW DECK
#  # SHUFFLE DECK
#  # DEAL TWO HANDS OF TWO CARDS, SHOW PLAYER'S
#  # SHOW DEALER'S UP CARD
#  # IF PLAYER HAS 21, AND DEALER DOES NOT, GAME OVER
#  # IF DEALER HAS 21, GAME OVER
#  # IF DEALER HAS <21 ASK PLAYER IF - HIT OR STAY
#  # IF HIT, ADD CARD TO PLAYER'S HAND
#  # DEALER SHOWS HOLE CARD, STAYS AT 17
#  # IF STAY, COMPARE DEALER/PLAYER, CLOSEST TO 21 WINS
 
#  $d = Deck.new
#  $player = Hand.new
#  $dealer = Hand.new
 
#  puts "As the dealer sweeps her hand, the hands are dealt.."
 
#  puts "You have a "+$player.hand[0].to_s+" and a "+$player.hand[1].to_s
#  puts $player.to_s
 
#  puts "The dealer has a "+$dealer.hand[0].to_s+" showing."
 
#  if $player.value === 21
#     puts "YOU WIN!"
#  else
 
#     until $player.value > 21
#         $player.switch_ace
#         puts "Do you want to hit(h) or stay(s)?"
#         action = $stdin.gets.chomp
#         if action == "h"
#           puts "You chose to hit, here's your new hand"
#           $player.hit
#           puts $player.to_s
#         else
#           puts "You chose to stay, here's your final hand"
#           puts $player.to_s
#           break
#         end
#       end
 
#       puts "Dealer's hand:"
#       puts $dealer.to_s
 
#       if $player.value <= 21
#         if $player.value > $dealer.value
#           puts "Player wins"
#         elsif player.value == $dealer.value
#           puts "Dealer and Player tied"
#         else
#           puts "Dealer wins"
#         end
#       else
#         puts "Player busts. Dealer wins"
#       end
 
#     end
 
#  puts $player.to_s
 
 # require 'test/unit'
 
 # class CardTest < Test::Unit::TestCase
 #   def setup
 #     @card = Card.new(:hearts, :ten, 10)
 #   end
 
 #   def test_card_suit_is_correct
 #     assert_equal @card.suit, :hearts
 #   end
 
 #   def test_card_name_is_correct
 #     assert_equal @card.name, :ten
 #   end
 #   def test_card_value_is_correct
 #     assert_equal @card.value, 10
 #   end
 # end
 
 # class DeckTest < Test::Unit::TestCase
 #   def setup
 #     @deck = Deck.new
 #   end
 
 #   def test_new_deck_has_52_playable_cards
 #     assert_equal @deck.playable_cards.size, 52
 #   end
 
 #   def test_dealt_card_should_not_be_included_in_playable_cards
 #     card = @deck.deal_card
 #     assert(!@deck.playable_cards.include?(card))
 #   end
 
 #   def test_shuffled_deck_has_52_playable_cards
 #     @deck.shuffle
 #     assert_equal @deck.playable_cards.size, 52
 #   end
 # end



    def welcome
    puts"Welcome to the Blackjack Table"
    end
    
    def deal_card
      rand(11)+1
    end
    
    def display_card_total(card_total)
      puts "Your cards add up to #{card_total}"
    end
    
    def display_oppontents_card_total(opp_card_total)
      puts "Your opponents cards equal #{opp_card_total}"
    end 
    
    def prompt_user
      puts "Type 'h' to hit or 's' to stay"
    end
    
    def get_user_input
      answer = gets.chomp
    end
    
    def end_game(card_total,opp_card_total) #may have to take out the input later
      puts "Your opponents card total is #{opp_card_total}"
     puts "Sorry, you hit #{card_total}. Thanks for playing!"
    end
    
    def initial_round
    
      first_card = deal_card
    
      second_card = deal_card
    
      card_total = first_card+second_card
      
      return card_total
    end
    
    def dealer_initial_round
      dealer_hand=[]
      dealer_first_card = deal_card
      dealer_second_card = deal_card
      
      dealer_initial_round_total = dealer_first_card+dealer_second_card
      dealer_hand.push(dealer_initial_round_total)
      dealer_hand.push(dealer_first_card)
      dealer_hand.push(dealer_second_card)
      puts "Dealer is showing #{dealer_hand[1]}"
      return dealer_hand
    end 
    
    def stay_or_hit
      prompt_user
      answer = get_user_input
      answer
    end 
    
    
    def new_hit(card_total)
    card_total+=deal_card
    end 
    
    # =begin
    def hit?(current_card_total)
      prompt_user
      answer = get_user_input
      if answer == 's'
        return current_card_total
      elsif answer == 'h'
        current_card_total+=deal_card
        display_card_total(current_card_total)
        return current_card_total
      else
        invalid_command
        hit?(current_card_total)
      end
    end
    # =end 
    def dealer_flip(dealer_hand)
      puts "Dealer Flips his second card."
      puts""
      sleep(2)
      puts "The dealer is showing #{dealer_hand[1]} and #{dealer_hand[2]}"
      puts ""
      sleep(2)
      puts "The dealer's total is #{dealer_hand[0]}"
      puts ""
      sleep(2)
    end
    
      def dealer_hits?(dealer_hand)
      while dealer_hand[0]<=16
      new_card= deal_card
      sleep(2)
      puts "The dealer draws a #{new_card}"
      puts ""
        dealer_hand[0]+=new_card
        sleep(2)
        puts "The dealer's total is now #{dealer_hand[0]}"
        puts ""
      end
      if dealer_hand[0]<21
        puts"The dealer stands with #{dealer_hand[0]}"
        puts""
        dealer_total =dealer_hand[0]
        return dealer_total
      elsif dealer_hand[0]==21
        dealer_total =dealer_hand[0]
        return dealer_total
      else 
        puts "Dealer Busts!"
        return dealer_hand[0] #######moving on to winner
      end
    end 
    
    def winner?(dealer_total,card_total)
      if dealer_total==card_total
        puts "The Game is a Draw"
        return "House Wins"
      elsif dealer_total>card_total
        return "Dealer Wins with #{dealer_total}"
        elsif card_total>dealer_total
        return "You Win with #{card_total}"
      end
    end
    def invalid_command
      puts "Please enter a valid command"
    end
    
    #####################################################
    # get every test to pass before coding runner below #
    #####################################################
    def new_runner
      #setup 
    welcome
    card_total = initial_round
    display_card_total(card_total)
    dealer_hand=dealer_initial_round
    
    stay=false
    until (card_total>21 || stay)
      answer=stay_or_hit
      if answer =='h'
      card_total=new_hit(card_total)
      display_card_total(card_total)
      elsif answer =='s'
      stay=true
      else
        invalid_command
      end 
      end
      if card_total==21
        puts "You Drew Blackjack"
        return "You Win!!"
      end 
      if card_total>21
        puts "You Bust!"
        return "Dealer wins"
      end 
      dealer_flip(dealer_hand)
      dealer_total=dealer_hits?(dealer_hand)
      if dealer_total>21
        return "You Win"
      end
      winner?(dealer_total,card_total)
    end 
    
    new_runner
    
    # =begin 
    def runner
    welcome
    card_total = initial_round
    opp_card_total = opp_initial_round
    
    while card_total<21
    opp_card_total=opp_hit?(opp_card_total)
    card_total= hit?(card_total)
    display_card_total(card_total)
    end
    end_game(card_total,opp_card_total)
    # =begin puts""
    puts"--------------NEW GAME----------"
    # =end runner
end
    

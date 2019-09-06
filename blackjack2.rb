

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
    
    def end_game(card_total,opp_card_total)
      
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
    

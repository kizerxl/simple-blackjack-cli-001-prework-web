def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(11) + 1
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
   puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp 
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  card_total = 0
  2.times do 
    card_total += deal_card() 
  end 
  display_card_total(card_total)
  card_total
end

def hit?(hand_total)
  prompt_user()
  input = get_user_input()
  if input == 'h'
    hand_total += deal_card()
  elsif !( ['h', 's'].include? input) 
    invalid_command()
    prompt_user()
  end 
  hand_total
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  total = 0
  welcome()
  total += initial_round()
  begin 
    total = hit?(total)
    display_card_total(total)
  end until total > 21
  end_game(total)
end
    

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  card = rand(1..11)
  return card
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
  firstCard = deal_card
  secondCard = deal_card
  sum = firstCard + secondCard
  display_card_total(sum)
  return sum 
end

def hit?(card_total)
  prompt_user
  play = get_user_input
  if play == 'h'
    card_total += deal_card
  elsif play == 's' 
    card_total
  else 
    invalid_command
    hit?(card_total)
  end
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  hand = initial_round
  dealerScore = rand(15..24)
  newHand = hit?(hand)
  puts "Your hand is #{newHand}"
  until newHand > 21 || newHand == hand || dealerScore > 21 
    hand = newHand
    newHand = hit?(newHand)
    puts "Your new hand totals #{newHand}"
  end
  if dealerScore > 21 
    puts "The dealer drew #{dealerScore} and lost. You win... this round"
  elsif newHand > 21 || dealerScore == 21
    puts "You lose! Suckaaa"
  elsif newHand > dealerScore
    puts "WINNER WINNER CHICKEN DINNER $$$"
  else 
    puts "You lose. Play again?"
  end
end
    

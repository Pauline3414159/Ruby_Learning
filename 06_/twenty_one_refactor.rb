SUIT = ['Hearts', 'Diamonds', 'Spades', 'Clubs']

def promt(msg)
  puts("=>#{msg}")
end

# make a deck of cards
def ininitalize_suite_of_cards(suite)
  cards = Array.new(13) { |i| i + 2 }
  cards[-1] = 'Ace'
  cards[-2] = 'King'
  cards[-3] = 'Queen'
  cards[-4] = 'Jack'
  cards.map! do |card|
    card.to_s + " of #{suite}"
  end
end

DECK = SUIT.map { |suit| ininitalize_suite_of_cards(suit) }. flatten

#add card value to values in the hash
playdeck_hash = {}
DECK.each do |card|
  if card =~ /[\d]/
    playdeck_hash[card] = [card[0..1].to_i]
  elsif card.match('Ace')
    playdeck_hash[card] = [1]
  end
end

#add card status to values in the hash
playdeck_hash.each_value {|num| num << 'in deck'}
#make a duplicate of the hash so I can start with a clean deck each time
stack_of_cards = playdeck_hash.dup

def draw_cards_player(stack_of_cards_hsh, num_of_cards)
  in_deck_hash = stack_of_cards_hsh.select {|crds, arr| arr[1] == 'in deck'}
  drawn_arr = in_deck_hash.keys.sample(num_of_cards)
  drawn_arr.each do |card|
    in_deck_hash[card][1] = 'player hand'
  end
  stack_of_cards_hsh
end

def draw_cards_dealer(stack_of_cards_hsh, num_of_cards)
  in_deck_hash = stack_of_cards_hsh.select {|crds, arr| arr[1] == 'in deck'}
  drawn_arr = in_deck_hash.keys.sample(num_of_cards)
  drawn_arr.each do |card|
    in_deck_hash[card][1] = 'dealer hand'
  end
  stack_of_cards_hsh
end

def display_cards(stack_of_cards_hsh)
  player_hand = stack_of_cards_hsh.select {|crds, arr| arr[1] == 'player hand'}
  dealer_hand = stack_of_cards_hsh.select {|crds, arr| arr[1] == 'dealer hand'}
  promt("Dealer has a #{dealer_hand.keys[0]} and an unknown card.")
  promt("You have a #{player_hand.keys[0..-2].join(', ')} and a #{player_hand.keys[-1]}")
end

def ace? (hands_hsh)
 hands_hsh.keys.any? { |card| card.match?(/Ace/) }
end
  
def value_of_hand(hands_hsh)
  arr = hands_hsh.values.flatten.select {|num| num.is_a?Integer}
  arr.sum
end

def value_of_hand_with_ace(hands_hsh)
  arr = hands_hsh.values.flatten.select {|num| num.is_a?Integer}
  number_of_ace = arr.count(1)
  non_ace_value = value_of_hand(hands_hsh) - number_of_ace
  total_ace_value = 1
  if non_ace_value <= (10 - (number_of_ace - 1))
    total_ace_value = 11 + (number_of_ace - 1)
  else
    total_ace_value = number_of_ace
  end
  total_ace_value + non_ace_value
end

def final_value_of_hand(hands_hsh)
  if ace?(hands_hsh)
    return value_of_hand_with_ace(hands_hsh)
  else
    return value_of_hand(hands_hsh)
  end
end

def value_over_21?(value_of_cards)
  if value_of_cards > 21
    true
  else
    false
  end
end

def value_greater_or_equal_17?(value_of_cards)
  if value_of_cards >= 17
    true
  else
    false
  end
end

def hit_or_stay(string)
  string = nil
  loop do
    string = gets.chomp.downcase
    break if string == 'h' || string == 's'
    promt("Enter 'h' or 's'")
  end
  string
end

def display_player_card_value(hnds)
  promt("The value of your cards\
 is \
#{final_value_of_hand(hnds)}")
end

def wins(score_hsh, winner)
  if winner == 'player'
    promt('Player wins!')
    score_hsh['player_score'] += 1
  elsif winner == 'dealer'
    promt('Dealer wins!')
    score_hsh['dealer_score'] += 1
  end
end

def clear_screen
  system('clear') || system('cls')
end

scores = { 'player_score' => 0, 'dealer_score' => 0 }

loop do
  #deal cards
  draw_cards_player(stack_of_cards, 2)
  draw_cards_dealer(stack_of_cards, 2)
  #display cards
  promt('Player turn')
  display_cards(stack_of_cards)
  display_player_card_value(stack_of_cards.select {|crds, arr| arr[1] == 'player hand'})
  
  loop do
    promt("Enter 'h' to hit or 's' to stay")
    ans = hit_or_stay('userstring')
    break if ans == 's'
    draw_cards_player(stack_of_cards, 1)
    display_cards(stack_of_cards)
    display_player_card_value(stack_of_cards.select {|crds, arr| arr[1] == 'player hand'})
    break if value_over_21?(final_value_of_hand(stack_of_cards.select {|crds, arr| arr[1] == 'player hand'}))
  end
  
  if value_over_21?(final_value_of_hand(stack_of_cards.select {|crds, arr| arr[1] == 'player hand'}))
    promt('You have busted')
    wins(scores, 'dealer')
    break
  end
  
  promt('Dealer turn')
  loop do
    break if value_greater_or_equal_17?(final_value_of_hand(stack_of_cards.select {|crds, arr| arr[1] == 'dealer hand'}))
    draw_cards_dealer(stack_of_cards, 1)
    break if value_over_21?(final_value_of_hand(stack_of_cards.select {|crds, arr| arr[1] == 'dealer hand'}))
  end
  
  if value_over_21?(final_value_of_hand(stack_of_cards.select {|crds, arr| arr[1] == 'dealer hand'}))
    promt('Dealer has busted')
    wins(scores, 'player')
    break
  elsif final_value_of_hand(stack_of_cards.select {|crds, arr| arr[1] == 'dealer hand'}) > 
    final_value_of_hand(stack_of_cards.select  {|crds, arr| arr[1] == 'player hand'})
    wins(scores, 'dealer')
    promt("Dealer\
    had a #{stack_of_cards.select {|crds, arr| arr[1] == 'dealer hand'}.keys[0 .. -2].join (", ")}\
    and a #{stack_of_cards.select {|crds, arr| arr[1] == 'dealer hand'}.keys[-1]}}")
    break
  elsif final_value_of_hand(stack_of_cards.select {|crds, arr| arr[1] == 'dealer hand'}) < 
    final_value_of_hand(stack_of_cards.select  {|crds, arr| arr[1] == 'player hand'})
    wins(scores, 'player')
    break
  elsif final_value_of_hand(stack_of_cards.select {|crds, arr| arr[1] == 'dealer hand'}) ==
    final_value_of_hand(stack_of_cards.select  {|crds, arr| arr[1] == 'player hand'})
    promt("It's a tie!")
    break
  end
end
promt("Player score is #{scores['player_score']} and Dealer score is #{scores['dealer_score']}")
promt("Would you like to play again? ('y' to continue)")
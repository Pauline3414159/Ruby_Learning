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

# create lookup hash for card values
card_values = {}
DECK.each do |card|
  if card =~ /[\d]/
    card_values[card] = [card[0..1].to_i]
  elsif card.match('Ace')
    card_values[card] = [1]
  else
    card_values[card] = [10]
  end
end

card_values.freeze

# creates the deck of cards
playdeck = DECK.dup

def draw_cards(dck_arr, num_of_cards)
  dck_arr.sample(num_of_cards)
end

def remove_drawn_cards_from_playdeck!(dck, hnd)
  hnd.each do |card|
    dck.delete(card)
  end
  dck
end

def display_hands(phand, compvizcard)
  promt("Dealer has a #{compvizcard} and an unknown card.")
  last = phand[-1]
  promt("You have a #{phand[0..-2].join(', ')} and a #{last}")
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

def value_of_hand(hnd, valuehsh)
  val_arr = []
  hnd.each do |card|
    val_arr << valuehsh[card]
  end
  val_arr.flatten!
  val_arr.sum
end

def ace?(hnd)
  hnd.any? { |card| card.match?(/Ace/) }
end

def value_with_ace(hnd, valuehsh)
  sorted_arr = hnd.partition { |card| card.match?(/Ace/) }
  non_ace_card_value = value_of_hand(sorted_arr[1], valuehsh)
  num_of_ace = sorted_arr[0].size
  total_ace_value = 1
  if non_ace_card_value <= (10 - (num_of_ace - 1))
    total_ace_value = 11 + (num_of_ace - 1)
  else
    total_ace_value = num_of_ace
  end
  total_ace_value + non_ace_card_value
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

scores = { 'player_score' => 0, 'dealer_score' => 0 }

loop do
  loop do
    system 'clear'
    # deal inital cards
    player_hand = draw_cards(playdeck, 2)
    remove_drawn_cards_from_playdeck!(playdeck, player_hand)
    comp_hand = draw_cards(playdeck, 2)
    comp_visible_card = comp_hand.sample
    remove_drawn_cards_from_playdeck!(playdeck, comp_hand)
    display_hands(player_hand, comp_visible_card)
    # player turn
    promt('Player turn')
    player_value_of_hand = 0
    # loop
    loop do
      player_value_of_hand = value_with_ace(player_hand, card_values)
      promt("Enter 'h' to hit or 's' to stay")
      ans = hit_or_stay('userstring')
      break if ans == 's'
      player_hand << draw_cards(playdeck, 1)
      player_hand.flatten!
      remove_drawn_cards_from_playdeck!(playdeck, player_hand)
      display_hands(player_hand, comp_visible_card)
      player_value_of_hand = value_with_ace(player_hand, card_values)
      promt("The value of your hand is #{player_value_of_hand}")
      break if value_over_21?(player_value_of_hand)
    end
    if value_over_21?(player_value_of_hand)
      promt('Player has busted! Dealer wins.')
      scores['dealer_score'] += 1
      break
    end
    # computer turn
    promt('Dealer turn')
    comp_value_of_hand = 0
    # loop
    loop do
      comp_value_of_hand = value_with_ace(comp_hand, card_values)
      break if value_greater_or_equal_17?(comp_value_of_hand)
      temp_display = draw_cards(playdeck, 1)
      promt("Dealer drew a #{temp_display.join}")
      comp_hand << temp_display
      comp_hand.flatten!
      remove_drawn_cards_from_playdeck!(playdeck, comp_hand)
      break if value_over_21?(comp_value_of_hand)
    end
    if value_over_21?(comp_value_of_hand)
      promt('Dealer has busted. Player wins!')
      scores['player_score'] += 1
      break
    end
    # compare values
    if player_value_of_hand > comp_value_of_hand
      promt('Player wins!')
      scores['player_score'] += 1
      break
    elsif player_value_of_hand == comp_value_of_hand
      promt("It's a tie")
      break
    elsif comp_value_of_hand > player_value_of_hand
      promt("Dealer had a #{comp_hand[0..-2].join(', ')} and a #{comp_hand[-1]}")
      promt('Dealer wins.')
      scores['dealer_score'] += 1
      break
    end
  end
  promt("Player score is #{scores['player_score']} and dealer score is #{scores['dealer_score']}.")
  break if scores.values.any?(5)
  promt("Would you like to play again? Enter 'y' to continue")
  ans = gets.chomp.downcase
  break unless ans == 'y'
end
if scores['player_score'] == 5
  promt('Player won 5 rounds, player is the grand winner!')
elsif scores['dealer_score'] == 5
  promt('Dealer won 5 rounds, dealer is the grand winner!')
end
promt('Thanks for playing')

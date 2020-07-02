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

draw_cards_player(stack_of_cards,2)
draw_cards_dealer(stack_of_cards,3)

def display_cards(stack_of_cards_hsh)
  player_hand = stack_of_cards_hsh.select {|crds, arr| arr[1] == 'player hand'}
  dealer_hand = stack_of_cards_hsh.select {|crds, arr| arr[1] == 'dealer hand'}
  p player_hand
  p dealer_hand
end

display_cards(stack_of_cards)
  
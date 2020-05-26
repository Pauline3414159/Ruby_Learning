SUIT = ['Hearts','Diamonds','Spades','Clubs']

def promt(msg)
  puts("=>#{msg}")
end

def ininitalize_suite_of_cards(suite)
  cards = Array.new(13) {|i| i + 2}
  cards[-1], cards[-2], cards[-3], cards[-4] = 'Ace', 'King','Queen', 'Jack'
  cards.map! do |card|
    card.to_s + " of #{suite}"
  end
end

DECK = SUIT.map {|suit| ininitalize_suite_of_cards(suit)}. flatten

card_values = {}
DECK.each do |card|
  if card =~ /[\d]/
    card_values[card] = [card[0..1].to_i]
  elsif card.match('Ace')
    card_values[card] = [1,11]
  else
    card_values[card] = [10]
  end
end

card_values.freeze

playdeck = DECK.dup

def draw_cards(dck_arr, num_of_cards)
  cards = dck_arr.sample(num_of_cards)
end

def remove_drawn_cards_from_playdeck!(dck, hnd)
  hnd.each do |card|
    dck.delete(card)
  end
  dck
end

def display_hands(phand,compvizcard)
  promt("Dealer has a #{compvizcard} and an unknown card.")
  promt("You have a #{phand}")
end

#deal inital cards
player_hand = draw_cards(playdeck,2)
remove_drawn_cards_from_playdeck!(playdeck,player_hand)
comp_hand = draw_cards(playdeck, 2)
comp_visible_card = comp_hand.sample
remove_drawn_cards_from_playdeck!(playdeck,comp_hand)

display_hands(player_hand, comp_visible_card)
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


p playdeck_hash.values.flatten.select {|num| num.is_a?Integer}
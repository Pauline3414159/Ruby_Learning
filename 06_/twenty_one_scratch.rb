SUIT = ['Hearts','Diamonds','Spades','Clubs']

def ininitalize_suite_of_cards(suite)
  cards = Array.new(13) {|i| i + 2}
  cards[-1], cards[-2], cards[-3], cards[-4] = 'Ace', 'King','Queen', 'Jack'
  cards.map! do |card|
    card.to_s + " of #{suite}"
  end
end

def promt(msg)
  puts("=>#{msg}")
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

def value_of_hand (hnd, valuehsh)
  val_arr = []
  hnd.each do |card|
    val_arr << valuehsh[card]
  end
  val_arr.flatten!
  val_arr.sum
end

def has_ace?(hnd)
  hnd.any?{|card| card.match?(/Ace/)}
end

def value_with_ace(hnd, valuehsh)
  sorted_arr = hnd.partition {|card| card.match?(/Ace/)}
  non_ace_card_value = value_of_hand(sorted_arr[1],valuehsh)
  total_ace_value = 1
  case sorted_arr[0].size
  when 1
    if non_ace_card_value <= 10
      total_ace_value = 11
    else
      total_ace_value = 1
    end
  when 2
    if non_ace_card_value <= 9
      total_ace_value = 12
    else
      total_ace_value = 2
    end
  when 3 
    if non_ace_card_value <= 8
      total_ace_value = 13
    else
      total_ace_value = 3
    end
  when 4
    if non_ace_card_value <= 7
      total_ace_value = 14
    else
      total_ace_value = 4
    end
  end
  p total_ace_value
  p non_ace_card_value
  p total_ace_value + non_ace_card_value
  total_ace_value + non_ace_card_value
end

# #deal inital cards
# player_hand = draw_cards(playdeck,2)
# remove_drawn_cards_from_playdeck!(playdeck,player_hand)
# comp_hand = draw_cards(playdeck, 2)
# comp_visible_card = comp_hand.sample
# remove_drawn_cards_from_playdeck!(playdeck,comp_hand)
# display_hands(player_hand, comp_visible_card)

# #player turn
# promt('Player turn')
# #loop
# loop do
#   promt("Enter 'h' to hit or 's' to stay")
#   ans = hit_or_stay('userstring')
#   break if ans == 's'
#   player_hand << draw_cards(playdeck,1)
#   player_hand.flatten!
#   remove_drawn_cards_from_playdeck!(playdeck, player_hand)
#   p player_hand
#   #p comp_hand
#   #p playdeck
# end

acetesthandunder1 = ["Ace of Hearts", "4 of Clubs"] # 11, 4, 15 true
acetesthandover1 = ["Ace of Hearts", "Queen of Hearts", "3 of Clubs"] # 1, 13, 14 true

acetesthandunder2 = ["Ace of Hearts", "4 of Clubs", "Ace of Spades"] #12, 4, 16 true
acetesthandover2 = ["Ace of Hearts", "Queen of Clubs", "Ace of Spades"] # 2, 10, 12 true

acetesthandunder3 = ["Ace of Hearts", "2 of Clubs", "Ace of Spades", "Ace of Diamonds"] # 13, 2, 15 true
acetesthandover3 = ["Ace of Hearts", "Queen of Clubs", "Ace of Spades", "Ace of Diamonds"] # 3, 10, 13 true

acetesthandover4 = ["Ace of Hearts", "2 of Clubs", "Ace of Spades", "Ace of Diamonds", "Ace of"] # 14 , 2 , 16 true 
acetesthandunder4 = ["Ace of Hearts", "Queen of Clubs", "Ace of Spades", "Ace of Diamonds", "Ace of"] #4, 10, 14 true

# p value_with_ace(acetesthandunder1, card_values)
# p value_with_ace(acetesthandover1, card_values)

# p value_with_ace(acetesthandunder2, card_values)
# p value_with_ace(acetesthandover2, card_values)

# p value_with_ace(acetesthandover3, card_values)
# p value_with_ace(acetesthandunder3, card_values)

# p value_with_ace(acetesthandover4, card_values)
# p value_with_ace(acetesthandunder4, card_values)

# def value_with_ace(hnd, valuehsh)
#   sorted_arr = hnd.partition {|card| card.match?(/Ace/)}
#   non_ace_card_value = value_of_hand(sorted_arr[1],valuehsh)
#   total_ace_value = 1
#   case sorted_arr[0].size
#   when 1
#     if non_ace_card_value <= 10
#       total_ace_value = 11
#     else
#       total_ace_value = 1
#     end
#   when 2
#     if non_ace_card_value <= 9
#       total_ace_value = 12
#     else
#       total_ace_value = 2
#     end
#   when 3 
#     if non_ace_card_value <= 8
#       total_ace_value = 13
#     else
#       total_ace_value = 3
#     end
#   when 4
#     if non_ace_card_value <= 7
#       total_ace_value = 14
#     else
#       total_ace_value = 4
#     end
#   end
#   p total_ace_value
#   p non_ace_card_value
#   p total_ace_value + non_ace_card_value
#   total_ace_value + non_ace_card_value
# end
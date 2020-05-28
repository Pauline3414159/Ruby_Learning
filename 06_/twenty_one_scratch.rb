#testing hands
# acetesthandunder1 = ["Ace of Hearts", "4 of Clubs"] # 11, 4, 15 true yes 
# acetesthandover1 = ["Ace of Hearts", "Queen of Hearts", "3 of Clubs"] # 1, 13, 14 true yes

# acetesthandunder2 = ["Ace of Hearts", "4 of Clubs", "Ace of Spades"] #12, 4, 16 true yes 
# acetesthandover2 = ["Ace of Hearts", "Queen of Clubs", "Ace of Spades"] # 2, 10, 12 true yes 

# acetesthandunder3 = ["Ace of Hearts", "2 of Clubs", "Ace of Spades", "Ace of Diamonds"] # 13, 2, 15 true yes 
# acetesthandover3 = ["Ace of Hearts", "Queen of Clubs", "Ace of Spades", "Ace of Diamonds"] # 3, 10, 13 true yes 

# acetesthandover4 = ["Ace of Hearts", "2 of Clubs", "Ace of Spades", "Ace of Diamonds", "Ace of"] # 14 , 2 , 16 true yes
# acetesthandunder4 = ["Ace of Hearts", "Queen of Clubs", "Ace of Spades", "Ace of Diamonds", "Ace of"] #4, 10, 14 true yes 

require 'pry'

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
    card_values[card] = [1]
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
  num_of_ace = sorted_arr[0].size
  total_ace_value = 1
  if non_ace_card_value <= (10 - (num_of_ace - 1))
    total_ace_value = 11 + (num_of_ace - 1)
  else
    total_ace_value = num_of_ace
  end
  #binding.pry
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

loop do
  loop do
    system 'clear'
    #deal inital cards
    player_hand = draw_cards(playdeck,2)
    remove_drawn_cards_from_playdeck!(playdeck,player_hand)
    comp_hand = draw_cards(playdeck, 2)
    comp_visible_card = comp_hand.sample
    remove_drawn_cards_from_playdeck!(playdeck,comp_hand)
    display_hands(player_hand, comp_visible_card)
    
    #player turn
    promt('Player turn')
    player_value_of_hand = 0
    #loop
    loop do
      player_value_of_hand = value_with_ace(player_hand, card_values)
      promt("Enter 'h' to hit or 's' to stay")
      ans = hit_or_stay('userstring')
      break if ans == 's'
      player_hand << draw_cards(playdeck,1)
      player_hand.flatten!
      remove_drawn_cards_from_playdeck!(playdeck, player_hand)
      display_hands(player_hand,comp_visible_card)
      player_value_of_hand = value_with_ace(player_hand, card_values)
      promt("The value of your hand is #{player_value_of_hand}")
      break if value_over_21?(player_value_of_hand)
    end
    
    if value_over_21?(player_value_of_hand)
      promt('Player has busted! Dealer wins.')
      p player_value_of_hand
      
      break
    end
    
    #computer turn
    promt('Dealer turn')
    comp_value_of_hand = 0
    #loop
    loop do
      comp_value_of_hand = value_with_ace(comp_hand, card_values)
      break if value_greater_or_equal_17?(comp_value_of_hand)
      temp_display = draw_cards(playdeck,1)
      promt("Dealer drew a #{temp_display.join}")
      comp_hand << temp_display
      comp_hand.flatten!
      remove_drawn_cards_from_playdeck!(playdeck, comp_hand)
      break if value_over_21?(comp_value_of_hand)
    end
    
    if value_over_21?(comp_value_of_hand)
      promt('Dealer has busted. Player wins!')
      p player_value_of_hand
      p comp_value_of_hand
      break
    end
    p player_value_of_hand
    p comp_value_of_hand
    #compare values
    if player_value_of_hand > comp_value_of_hand
      promt('Player wins!')
      break
    elsif player_value_of_hand == comp_value_of_hand
      promt("It's a tie")
      break
    elsif comp_value_of_hand > player_value_of_hand
      promt("Dealer had #{comp_hand[0..-2].join(', ')} and a #{comp_hand[-1]}")
      promt('Dealer wins.')
      break
    end
  end
  promt("Would you like to play again? Enter 'y' to continue")
  ans = gets.chomp.downcase
  break unless ans == 'y'
end
promt('Thanks for playing')
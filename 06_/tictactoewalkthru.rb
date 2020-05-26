require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUETER_MARKER = 'O'

def display_board(brd)
  system 'clear'
  puts ""
  puts "      |      |"
  puts "  #{brd[1]}   |   #{brd[2]}  |  #{brd[3]}"
  puts "      |      |"
  puts "------+------+-----"
  puts "      |      |"
  puts "  #{brd[4]}   |   #{brd[5]}  |  #{brd[6]}"
  puts "      |      |"
  puts "------+------+-----"
  puts "      |      |"
  puts "  #{brd[7]}   |   #{brd[8]}  |  #{brd[9]}"
  puts "      |      |"
  puts ""
end

def prompt (msg)
  puts "=> #{msg}"
end

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = INITIAL_MARKER}
  new_board
end

def empty_squares(brd)
  brd.keys.select {|num| brd[num] == INITIAL_MARKER}
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Chose a square #{joinor(empty_squares(brd))}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUETER_MARKER
end

# def computer_places_piece!(brd, boolean)
#   if boolean == false
#     square = empty_squares(brd).sample
#     brd[square] = COMPUETER_MARKER
#   elsif boolean == true
#     square = comp_square_with_threat(brd)
#     brd[square] = COMPUETER_MARKER
#   end
# end

def detect_threat?(brd)
  winning_lines = [[1,2,3],[4,5,6],[7,8,9]] +
                  [[1,4,7],[2,5,8],[3,6,9]] +
                  [[1,5,9],[3,5,7]]
  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER && brd[line[1]] == PLAYER_MARKER
      return true
    elsif brd[line[1]] == PLAYER_MARKER && brd[line[2]] == PLAYER_MARKER
      return true
    else
      return false
    end
  end
end

def comp_square_with_threat(brd)
   winning_lines = [[1,2,3],[4,5,6],[7,8,9]] +
                  [[1,4,7],[2,5,8],[3,6,9]] +
                  [[1,5,9],[3,5,7]]
  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER && brd[line[1]] == PLAYER_MARKER
      brd [line[2]] = COMPUETER_MARKER
    elsif brd[line[1]] == PLAYER_MARKER && brd[line[2]] == PLAYER_MARKER
      brd[line[0]] = COMPUETER_MARKER
    end
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [[1,2,3],[4,5,6],[7,8,9]] +
                  [[1,4,7],[2,5,8],[3,6,9]] +
                  [[1,5,9],[3,5,7]]
  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
       return 'Player'
    elsif 
       brd[line[0]] == COMPUETER_MARKER &&
       brd[line[1]] == COMPUETER_MARKER &&
       brd[line[2]] == COMPUETER_MARKER
       return 'Computer'
    end
  end
  nil
end

def joinor(arr, x = ', ' , z = 'or')
    if arr.size > 1
      last_value = arr.pop
      prompt("#{arr.join(x)}#{x}#{z} #{last_value}")
    else
      prompt("#{arr[0]}")
    end
end

def update_score(winner, hshofscore)
  if winner == 'Player'
    hshofscore[:player] += 1
  else
    hshofscore[:computer] += 1
  end
  hshofscore
end
score = {player: 0, computer: 0}
loop do
  
  board = initialize_board
  
  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board)||board_full?(board)
    #binding.pry
    if detect_threat?(board) == false
      computer_places_piece!(board)
    elsif detect_threat?(board) == true
      comp_square_with_threat(board)
    end
    display_board(board)
    break if someone_won?(board)||board_full?(board)
  end
  
  display_board(board)
  
  if someone_won?(board)
    prompt("#{detect_winner(board)} won!")
  else
    prompt("It's a tie.")
  end
  
  update_score(detect_winner(board), score)

  prompt("The player score is #{score[:player]} and the computer score is #{score[:computer]}")
  if score[:player] == 5
    prompt('Player is the grand winner!')
    break
  elsif score[:computer] == 5
    prompt('Computer is the grand winner!')
    break
  end
  
  prompt("Would you like to play again? Type 'y' or 'n'")
  ans = gets.chomp.downcase
  break unless ans == 'y'
end

prompt('Thanks for playing tic tac toe !')

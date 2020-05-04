VALID_CHOICE = %w(rocks paper scissors spock lizard)
user_choice = nil
comp_choice = nil
user_wins = 0
comp_wins = 0
win_hash = {
  'scissors' => ['paper', 'lizard'],
  'paper' => ['rock', 'spock'],
  'rocks' => ['lizard', 'scissors'],
  'lizard' => ['paper', 'spock'],
  'spock' => ['scissors', 'rocks']
}

def disp_to_user(x)
  puts "=>#{x}"
end

def clear_screen
  system('clear') || system('cls')
end

def valid_user_input?(input)
  if VALID_CHOICE.include?(input.downcase) || input.start_with?('r', 's', 'l', 'p') && input.size == 1
    true
  end
end

def gets_user_input
  disp_to_user("Please choose #{VALID_CHOICE}.")
  disp_to_user('You can enter the first letter of your choice or type it out.')
  user_input = nil
  loop do
    user_input = gets.chomp.downcase
    break if valid_user_input?(user_input) == true
    disp_to_user('Please enter r, s, l, or p')
  end
  user_input
end

def c_or_p?(input)
  disp_to_user('please enter c for scissors or p for spock')
  loop do
    input = gets.chomp.downcase
    if input.start_with?('c')
      input = 'scissors'
      break
    elsif input.start_with?('p')
      input = 'spock'
      break
    else
      disp_to_user('please enter c or p')
    end
    input
  end
  input
end

def s_check?(input)
  if input.start_with?('s')
    c_or_p?(input)
  else input
  end
end

def clean_up_user_choice(input)
  case input
  when 'r' then input = 'rocks'
  when 'spock' then input = 'spock'
  when 'scissors' then input = 'scissors'
  when 'l' then input = 'lizard'
  when 'p' then input = 'paper'
  end
  input
end

def check_for_tie(user_input, computer_input)
  if user_input == computer_input
    true
  end
end

def check_for_win(user_input, computer_input, win_hash)
  if win_hash[user_input].include?(computer_input)
    true
  else
    false
  end
end

def play_again
  disp_to_user("Would you like to play again? Enter 'y' to continue")
  ans = gets.chomp.downcase
  unless ans.start_with?('y') then return false
  end
end

def grand_win_check(uwins, cwins)
  if uwins == 5
    disp_to_user('You have won five rounds! You are the grand winner!')
  elsif cwins == 5
    disp_to_user('Computer has won five roudns! Computer is the grand winner!')
  end
end

disp_to_user('Welcome to Rocks Paper Scissors Spock Lizard!')
loop do
  user_choice = gets_user_input
  if VALID_CHOICE.include?(user_choice)
    user_choice
  else
    user_choice = s_check?(user_choice)
    user_choice = clean_up_user_choice(user_choice)
  end
  comp_choice = VALID_CHOICE.sample
  disp_to_user(" You picked #{user_choice} and the computer picked #{comp_choice}.")
  if check_for_win(user_choice, comp_choice, win_hash) == true
    disp_to_user('You win!')
    user_wins += 1
  elsif check_for_tie(user_choice, comp_choice) == true
    disp_to_user("It's a tie")
  else
    disp_to_user('You lose.')
    comp_wins += 1
  end
  grand_win_check(user_wins, comp_wins)
  break if user_wins == 5 || comp_wins == 5
  disp_to_user("Current scores is player: #{user_wins} and computer: #{comp_wins}")
  break if play_again == false
  clear_screen
end
clear_screen
disp_to_user('thanks for playing')

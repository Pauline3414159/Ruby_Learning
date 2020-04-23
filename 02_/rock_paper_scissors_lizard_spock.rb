def disp_to_user(x)
  puts "=>#{x}"
end

VALID_CHOICE = %w(rocks paper scissors spock lizard)
user_choice = nil
comp_choice = nil

disp_to_user('Welcome to Rocks Paper Scissors Spock Lizard!')
loop do
  loop do
    disp_to_user("Please choose #{VALID_CHOICE}.")
    user_choice = gets.chomp.downcase
    if VALID_CHOICE.include?(user_choice)
      break
    else
      disp_to_user('Not a valid choice')
    end
  end
  
  comp_choice = VALID_CHOICE.sample
  
  disp_to_user(" You picked #{user_choice} and the computer picked #{comp_choice}.")
  
  case user_choice
  when 'scissors'
    if comp_choice == 'paper'|| comp_choice == 'lizard'
      then disp_to_user('You win!')
    elsif comp_choice == 'rocks'|| comp_choice =='spock'
      then disp_to_user('You lose!')
    else
      disp_to_user("It's a tie")
    end
  when 'paper'
    if comp_choice == 'rock'|| comp_choice == 'spock'
      then disp_to_user('You win!')
    elsif comp_choice == 'scissors'|| comp_choice =='lizard'
      then disp_to_user('You lose!')
    else
      disp_to_user("It's a tie.")
    end
  end
  
  disp_to_user('Would you like to play again?')
  ans = gets.chomp.downcase
  break unless ans.start_with?('y')
end
disp_to_user('Thanks for playing.')

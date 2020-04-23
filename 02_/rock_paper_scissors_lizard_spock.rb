VALID_CHOICE = %w(rocks paper scissors spock lizard)
user_choice = nil
comp_choice = nil
user_wins = 0
comp_wins = 0

def disp_to_user(x)
  puts "=>#{x}"
end

disp_to_user('Welcome to Rocks Paper Scissors Spock Lizard!')
loop do
  loop do
    disp_to_user("Please choose #{VALID_CHOICE}.")
    disp_to_user('You can enter the first letter of your choice or type it out.')
    user_choice = gets.chomp.downcase
    if VALID_CHOICE.include?(user_choice)
      break
    elsif user_choice.start_with?('r', 's', 'l', 'p')
      if user_choice.start_with?('r')
        then user_choice = 'rocks'
      elsif user_choice.start_with?('l')
        then user_choice = 'lizard'
      elsif user_choice.start_with?('p')
        then user_choice = 'paper'
      elsif user_choice.start_with?('s')
        then disp_to_user('Press c for scissors and p for spock')
          loop do
            s_check = gets.chomp.downcase
              if s_check.start_with?('c')
                then user_choice = 'scissors'
                break
              elsif s_check.start_with?('p')
                then user_choice = 'spock'
                break
              else
                disp_to_user('Enter a c or p please')
              end
          end
      end
    break
    else
      disp_to_user('Not a valid choice')
    end
  end
  
  comp_choice = VALID_CHOICE.sample
  
  disp_to_user(" You picked #{user_choice} and the computer picked #{comp_choice}.")
  
  case user_choice
  when 'scissors'
    if comp_choice == 'paper' || comp_choice == 'lizard'
      then 
        disp_to_user('You win!')
        user_wins += 1
    elsif comp_choice == 'rocks' || comp_choice == 'spock'
      then 
        disp_to_user('You lose!')
        comp_wins += 1
    else
      disp_to_user("It's a tie")
    end
  when 'paper'
    if comp_choice == 'rock' || comp_choice == 'spock'
      then 
        disp_to_user('You win!')
        user_wins += 1
    elsif comp_choice == 'scissors' || comp_choice == 'lizard'
      then 
        disp_to_user('You lose!')
        comp_wins += 1
    else
      disp_to_user("It's a tie.")
    end
  when 'rocks'
    if comp_choice == 'lizard' || comp_choice == 'scissors'
      then 
        disp_to_user('You win!')
        user_wins += 1
    elsif comp_choice == 'paper' || comp_choice == 'spock'
      then 
        disp_to_user('You lose!')
        comp_wins += 1
    else
      disp_to_user("It's a tie.")
    end
  when 'lizard'
    if comp_choice == 'paper' || comp_choice == 'spock'
      then 
      disp_to_user('You win!')
      user_wins += 1
    elsif comp_choice == 'scissors' || comp_choice == 'rocks'
      then 
      disp_to_user('You lose!')
      comp_wins += 1
    else
      disp_to_user("It's a tie.")
    end
  when 'spock'
    if comp_choice == 'scissors' || comp_choice == 'rocks'
      then 
      disp_to_user('You win!')
      user_wins += 1
    elsif comp_choice == 'paper' || comp_choice == 'lizard'
      then 
      disp_to_user('You lose!')
      comp_wins += 1
    else
      disp_to_user("It's a tie.")
    end
  end
  
  disp_to_user("Current scores is player: #{user_wins} and computer: #{comp_wins}")
  
  if user_wins == 5
    disp_to_user('You have won five rounds! You are the grand winner!')
    break
  elsif comp_wins == 5
    disp_to_user('Computer has won five roudns! Computer is the grand winner!')
    break
  end
  
  disp_to_user('Would you like to play again?')
  ans = gets.chomp.downcase
  break unless ans.start_with?('y')
  
end

disp_to_user('Thanks for playing.')
 


def player_choice
  puts 'Choose rocks (r), paper (p), or scissors(s)'
  response = gets.chomp.downcase
  case response
  when 'r' then 0
  when 'p' then 1
  when 's' then 2
  else player_choice
  end
end

def comp_choice
  rocks_paper_sciss = ['rocks', 'paper', 'scissors']
  comp_outcome = rocks_paper_sciss.sample
  case comp_outcome
  when 'rocks'
    puts 'Computer chose rocks.'
    return 0
  when 'paper'
    puts 'Computer chose paper.'
    return 1
  when 'scissors'
    puts 'Computer chose scissors.'
    return 2
  end
end

def compare_choice(x, y)
  case
  when x == y then 'tie'
  when x == 0 && y == 1 then 'paper'
  when x == 0 && y == 2 then 'rocks'
  when x == 1 && y == 0 then 'paper'
  when x == 1 && y == 2 then 'scissors'
  when x == 2 && y == 0 then 'rocks'
  when x == 2 && y == 1 then 'paper'
  end
end

def proper_message(x)
  case
  when x == 'tie' then puts "It's a tie!"
  when x == 'paper' then puts 'Paper beats rocks, paper wins!'
  when x == 'rocks' then puts 'Rocks beats scissors, rock wins!'
  end
end

puts 'Welcome to Rocks, Paper, Scissors!'

loop do
  player_choice_result = player_choice
  comp_choice_results = comp_choice
  result = compare_choice(player_choice_result, comp_choice_results)
  proper_message(result)
  puts 'Play again? (y to continue)'
  play_again = gets.chomp.downcase
  break if play_again != 'y'
end


puts 'thank you for playing!'
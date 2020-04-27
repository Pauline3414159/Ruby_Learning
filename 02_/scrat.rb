def disp_to_user(x)
  puts "=>#{x}"
end

def grand_win_check(uwins,cwins)
  if uwins == 5
    disp_to_user('You have won five rounds! You are the grand winner!')
  elsif cwins == 5
    disp_to_user('Computer has won five roudns! Computer is the grand winner!')
  end
  return
end

grand_win_check(4,5)
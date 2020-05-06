# Write a program that solicits 6 numbers from the user, 
# then prints a message that describes whether or not
# the 6th number appears amongst the first 5 numbers.

def print_to_user(string)
  puts "=>#{string}"
end

def obtain_num_user(counter)
  print_to_user("Enter the number #{counter} number:")
  gets.chomp.to_i
end

user_num_arr = []
user_num_counter = 1

until user_num_counter > 6
  user_num_arr << obtain_num_user(user_num_counter)
  user_num_counter += 1
end
x = user_num_arr.pop
if user_num_arr.include?(x)
  print_to_user("The number #{x} appears in #{user_num_arr}")
else
  print_to_user("The number #{x} does not appear in #{user_num_arr}")
end

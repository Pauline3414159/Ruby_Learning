

# Build a program that displays when the user will retire
# and how many years she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

def print_to_user(string)
  puts "=>#{string}"
end

def obtain_current_age
  print_to_user('What is you age?')
  age = nil
  loop do
    age = gets.chomp.to_i
    break if age > 0
    print_to_user('Enter in a postive number')
  end
  age
end

def obtain_retirement_age(current_age)
  print_to_user('At what age would you like to retire?')
  retire_age = nil
  loop do
    retire_age = gets.chomp.to_i
    break if retire_age > current_age
    print_to_user('Enter a number that is greater than your current age')
  end
  retire_age
end

print_to_user('Welcome to Retierment Calculator')
loop do
  age = obtain_current_age
  retirement_age = obtain_retirement_age(age)
  years_to_retire = retirement_age - age
  print_to_user("It's #{Time.now.year}.
  You will retire in #{Time.now.year + years_to_retire}")
  print_to_user("You have only #{years_to_retire} years of work to go.")
  print_to_user("Enter 'y' to calculate again")
  ans = gets.chomp.downcase
  break unless ans == 'y'
end
print_to_user('Thanks for using retiermetn calculator.')

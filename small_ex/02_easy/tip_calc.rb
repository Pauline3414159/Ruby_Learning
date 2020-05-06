
# Create a simple tip calculator.
# The program should prompt for a bill amount and a tip rate. 
# The program must compute the tip and then display both the tip and 
# the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

# input - a float with two significant digits for the bill
# input - tip percentage - a float with two digits
# output display a string that shows the tip and the total bill amount with the tip
# algorythim

# get the bill , validate
# get the tip, validate

# calculat the tip
# calcuate the total

# print the tip and total to the user
bill = nil
tip = nil
tip_money = nil

puts '-Welcome to tip calculator'
loop do
  puts '-Enter the total bill'
  loop do
    bill = gets.chomp.to_f
    break if bill > 0
    puts '-Enter a valid bill (a postive number)'
  end
  
  puts '-Enter the tip'
  loop do
    tip = gets.chomp.to_f
    break if tip.between?(1,100)
    puts '-Enter a valid tip between 1% and 100%'
  end
  
  tip_money = bill * (tip/100)
  total = bill + tip_money
  puts "The tip is #{format("$%0.2f", tip_money)}"
  puts "The total is #{format("$%0.2f", total)}"
  puts "Press y to calcuate again"
  ans = gets.chomp.downcase
  break unless ans == 'y'
end
puts ' thanks for using tip calc'
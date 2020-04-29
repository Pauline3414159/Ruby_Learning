

# Build a program that asks a user for the length and width of a room in meters and then
# displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

# Example Run

# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).
# Modify this program to ask for the input measurements in feet,
# and display the results in square feet, square inches,
# and square centimeters.

loop do
  puts 'Enter the length of the room in meters:'
  length = gets.chomp.to_f.truncate(2)
  puts 'Enter the width of the room in meters:'
  width = gets.chomp.to_f.truncate(2)
  area = length * width
  puts " The area of the room is #{area} square meters (#{(area * 10.7639).truncate(2)}) square feet) "
  puts 'Enter y to continue, or any key to quit'
  ans = gets.chomp.downcase
  break unless ans == 'y'
end

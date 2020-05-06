# Write a program that prompts the user for two positive integers,
# and then prints the results of the following operations on those two numbers: 
# addition, subtraction, product, quotient, remainder, and power. 
# Do not worry about validating the input.

def print_to_user(string)
  puts "=>#{string}"
end

print_to_user('Enter the first number:')
number_a = gets.chomp.to_f
print_to_user('Enter the second number:')
number_b = gets.chomp.to_f
print_to_user("#{number_a} + #{number_b} = #{number_a + number_b}")
print_to_user("#{number_a} - #{number_b} = #{number_a - number_b}")
print_to_user("#{number_a} * #{number_b} = #{number_a * number_b}")
print_to_user("#{number_a} / #{number_a} = #{number_a / number_b}")
print_to_user("#{number_a} % #{number_b} = #{number_a % number_b}")
print_to_user("#{number_a} ** #{number_b} = #{number_a ** number_b}")
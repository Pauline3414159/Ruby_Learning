

# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all
# numbers between 1 and the entered integer.
# Examples:
# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.
# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

def print_to_user(string)
  puts "=>#{string}"
end

def obtain_user_int
  print_to_user('Please enter an integer greater than 0:')
  ans = nil
  loop do
    ans = gets.chomp.to_i
    break if ans > 0
    print_to_user('Enter a valid input')
  end
  ans
end

def sum_or_product
  print_to_user("Enter 's' to compute the sum, 'p' to compute the product.")
  ans = nil
  loop do
    ans = gets.chomp.downcase
    break if ans == 's' || ans == 'p'
    print_to_user('Enter a valid input')
  end
  ans
end

def make_array(num)
  num_ary = []
  until num.zero?
    num_ary << num
    num -= 1
  end
  num_ary
end

def array_product(ary)
  counter = 1
  num = ary[0]
  loop do
    break if counter == ary.size
    num *= ary[counter]
    counter += 1
  end
  num
end

user_int = obtain_user_int
sum_or_product_flag = sum_or_product
user_ary = make_array(user_int)
product_ans = array_product(user_ary)
if sum_or_product_flag == 's'
  print_to_user("The sum of the integers between 1 and #{user_int} is #{user_ary.sum}")
elsif sum_or_product_flag == 'p'
  print_to_user("The product of the integers between 1 and #{user_int} is #{product_ans} ")
end

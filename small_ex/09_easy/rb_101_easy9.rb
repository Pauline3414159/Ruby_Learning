# Create a method that takes 2 arguments,
# an array and a hash. The array will contain
# 2 or more elements that, when combined with 
# adjoining spaces, will produce a person's name.
# The hash will contain two keys, :title and :occupation
# , and the appropriate values. Your method should 
# return a greeting that uses the person's full name,
# and mentions the person's title and occupation.



# input is array of strings and a hash
# output is a printed strings

# use string interploation to pring approratly

# def greetings (array, hash)
#   puts " Hello, #{array.join(' ')}! It's nice to have a #{hash[:title]} #{hash[:occupation]} around. "
# end

# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# # => Hello, John Q Doe! Nice to have a Master Plumber around.

# A double number is a number with an even number of
# digits whose left-side digits are exactly the same 
# as its right-side digits. For example, 44, 3333, 
# 103103, 7676 are all double numbers. 444, 334433,
# and 107 are not.

# Write a method that returns 2 times the number
# provided as an argument, unless the argument is a
# double number; double numbers should be returned as-is.

# first, write method to check if number is a double number
# change the number to string, if length is odd then false
# if length is even, check to see if the first half is
# the same as the second half, if so, true

# second method should multipy the number if helper 
# method returns to false

# def double_number?(number)
#   halfway_index = (number.to_s.length/2) - 1
#   string_num = number.to_s
#   if string_num.length.even? && string_num[0..halfway_index] == string_num[(halfway_index + 1) .. (number.to_s.length - 1)] && 
#     string_num.length > 1
#     true
#   else
#     false
#   end
# end

# def twice(number)
#   if double_number?(number) == false
#     number * 2
#   else
#     number
#   end
# end


# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

# Write a method that takes a number as an argument.
# If the argument is a positive number,
# return the negative of that number. 
# If the number is 0 or negative, return the original number.

# input is a number, output is a negative number

# if number is greater than 0, mulitpy the input by -1 and return it 

# def negative(number)
#   if number > 0
#     number * -1
#   else
#     number
#   end
# end

# p negative(5) == -5
# p negative(-3) == -3
# p negative(0) == 0

=begin

Write a method that takes an integer argument, 
and returns an Array of all integers, in sequence,
between 1 and the argument.

You may assume that the argument will always be a 
valid integer that is greater than 0.

input is a postive integer and the output is an array of integers
simply initialize a new array that ends at the integer
=end

# def sequence(number)
#   Array.new(number) {|i| i+1}
# end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]

=begin
Write a method that takes a string argument, 
and returns true if all of the alphabetic characters
inside the string are uppercase, false otherwise.
Characters that are not alphabetic should be ignored.

input is a string, the output is a boolean
change string into array
check if there is any? [a-z], if so, false
=end

# def uppercase?(string)
#   if string.chars.any?(/[a-z]/)
#     false
#   else
#     true
#   end
# end

# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true

=begin
Write a method that takes a string as an argument, 
and returns an Array that contains every word from
the string, to which you have appended a space and 
the word length.

You may assume that words in the string are
separated by exactly one space, and that any 
substring of non-space characters is a word.

input is a string, out put is an array

split the string via spaces to make an array
in each elemement append a space plus the number of the 
length of the element
=end

# def word_lengths(string)
#   arr = string.split
#   arr.map do |word|
#     word + " #{word.length}"
#   end
# end

# p word_lengths('this is a test')

# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# p word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# p word_lengths("") == []
=begin
Write a method that takes a first name, a space, and a last name passed as a single 
String argument, and returns a string that contains the last name, a comma, a space
, and the first name.

input is a string, the output is a string
split the string into an array
reverse the array
append ", " to the first element
join the array
=end

# def swap_name(name)
#   arr = name.split.reverse
#   arr[0] = arr[0] + ", "
#   arr.join
# end

# p swap_name('Pauline Tanzman')
# p swap_name('Joe Roberts') == 'Roberts, Joe'

=begin
Create a method that takes two integers as arguments. The first argument is a
count, and the second is  the first number of a sequence that your method will 
create. The method should return an Array that cont
ains the same number of elements as the count argument, while the values of 
each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater
, while the starting number can be any integer value. If the count is 0, an 
empty list should be returned.

n times, multipy n and add it to answer array
=end

# def sequence(n,z)
#   ans = []
#   n = n
#   loop do
#     break if n == 0
#     ans << z * n
#     n -= 1
#   end
#   ans.reverse
# end

# p sequence(5, 1) == [1, 2, 3, 4, 5]
# p sequence(4, -7) == [-7, -14, -21, -28]
# p sequence(3, 0) == [0, 0, 0]
# p sequence(0, 1000000) == []

=begin
Write a method that determines the mean (average) of the three scores passed 
to it, and returns the letter value associated with that grade.
Numerical Score Letter 	Grade
90 <= score <= 100 	'A'
80 <= score < 90 	'B'
70 <= score < 80 	'C'
60 <= score < 70 	'D'
0 <= score < 60 	'F'

Tested values are all between 0 and 100. 
There is no need to check for negative values or values greater than 100.
add the three scores
divide by three
check to see which range the average is in and return the appropraite grate
=end
#require 'pry'
# def get_grade(score1, score2, score3)
#   average = (score1 + score2+ score3)/ 3
#   grade = nil
#   case average
#   when 0 .. 59
#     grade = 'F'
#   when 60 .. 69 
#     grade = 'D'
#   when 70 .. 79
#     grade = 'C'
#   when 80 .. 89 
#     grade = 'B'
#   when 90 .. 100
#     grade = 'A'
#   end
#   grade
#   #binding.pry
# end

# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"

=begin
Write a method which takes a grocery list (array) of fruits with quantities and
converts it into an array of the correct number of each fruit.
input is a two dimensional array with strings and integers, output is 
an array with only strings

for each sub array, make the count of the first element equal to the second 
element and map it to new array

then flatten it so we have one array
=end

# def buy_fruit(fruit_list)
#   ans = []
#     fruit_list.each do |subarr|
#       subarr[1].times do
#       ans << subarr[0]
#       end
#     end
#   ans.flatten
# end

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])
# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]
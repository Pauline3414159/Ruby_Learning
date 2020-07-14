=begin
you want to find the longest sentence in a text file
senteces can end with . , or !
any other group of chars that are seperated by spaces are considered words

examples - will just use example in the problem

data 
at the start, you have a full file of string
at the end, print out the longest sentence

algorthym
1. split the text into senteces
2. break down the senteces into words
3. find the sentences with the max words
4. print that sentences with the number of words in that sentence
=end

# test = 'this is a test. yes yes one one more more! five babble six?'
# test2 = test.dup
# test2 = test2.split(/[?!.]/)
# test2.map! do |word|
#   word.split
# end
# arr = []
# test2.each do |sent|
#   arr << sent.size
# end
# p arr
# p arr.index(arr.max)
# p test2[1].join(' ')

=begin
you have a library of pairs of letters 
each time you use a letter in the library, it takes out that pair
if you come accross a letter that's been used already, then it's false
if you can get thru without using a block twice, then its true
ex
data input is a string, output is a boolean
1. create two stacks, avalible and used
2. check to see if a letter is in used - if so, false
3. if the letter is avalible, move it and it's pair to the used stack
  find the index of it
  remove and attache
4. check the next letter and repeat - if you make it to the end, then true
=end

# avalible_stack = [['B','O'], ['X', 'K'], ['D','Q'], ['C','P'], ['N', 'A'],
# ['G', 'T'], ['R','E'], ['F','S'], ['J', 'W'], ['H', 'U'], ['V', 'I'], 
# ['L', 'Y'], ['Z','M']]

# used_stack = []

# avalible_stack.each do |pairs|
#   p pairs.index('O')
# end 
# test = 'oopsx'

# test.chars.each do |let|
#   if used_stack.flatten.any?(let.upcase)
#     puts false
#   else
#     avalible_stack.each do |sub|
#       sub.include?(let.upcase)
#       puts 'yes'
#     end
#   end
# end

=begin
A triangle is classified as follows:

    equilateral All 3 sides are of equal length
    isosceles 2 sides are of equal length, while the 3rd is different
    scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must 
be greater than the length of the longest side, and all sides must have lengths
greater than 0: if either of these conditions is not satisfied, the triangle is
invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments
, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid 
depending on whether the triangle is equilateral, isosceles, scalene, 
or invalid.

1. check if the triangle is valid
aa. check if any number is zero
a. find the two smallest numbers and add them
b. that number must larger than the final number

2. find the frequency of each element
3. if the freq is 3, then equlateral
if 2, then isoceles
if 1, then scalene
=end

# def triangle (x, y, z)
#   arr = [x, y, z]
#   if arr.any?(0)
#     return :invalid
#   elsif arr.min(2).sum < arr.max
#     return :invalid
#   end
#   hash = {}
#   arr.each do |num|
#     if hash.has_key?(num)
#       hash[num] += 1
#     else
#       hash[num] = 1
#     end
#   end
#   if hash.has_value?(3)
#     :equilateral
#   elsif hash.has_value?(2)
#     :isosceles
#   else
#     :scalene
#   end
# end
  
# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid

=begin

    right One angle of the triangle is a right angle (90 degrees)
    acute All 3 angles of the triangle are less than 90 degrees
    obtuse One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees,
and all angles must be greater than 0: if either of these conditions is not 
satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, 
and returns a symbol :right, :acute, :obtuse, or :invalid depending 
on whether the triangle is a right, acute, obtuse, or invalid triangle.

argurment of three integers, return a symbol
take the three arguments and turn into array
if any argument is zero, then invalid
if the sum of all the arguments is greater than 180 deg, invalid
if 90 deg is present, right
if all elements are less than 90 acute
else obtuse
=end

# def triangle (a, b, c)
#   arr = [a, b, c]
#   if arr.any?(0)
#     :invalid
#   elsif arr.sum != 180
#     :invalid
#   elsif arr.include?(90)
#     :right
#   elsif arr.all?{|ang| ang < 90}
#     :acute
#   else
#     :obtuse
#   end
# end

# p triangle(60, 70, 50) == :acute
# p triangle(30, 90, 60) == :right
# p triangle(120, 50, 10) == :obtuse
# p triangle(0, 90, 90) == :invalid
# p triangle(50, 50, 50) == :invalid

=begin
Write a method that returns the number of Friday the 13ths in the year
given by an argument. You may assume that the year is greater than 1752
(when the United Kingdom adopted the modern Gregorian Calendar) and that
it will remain in use for the foreseeable future.
input is a year, output is an integer representing the number of friday the 13
there are in that year.
1. list the fridays and date of the friday in a year
2. select only the fridays that are the 13th
3. return the size of that selected list
=end

# def friday_13th(year)
#     t = Time.local(year)
#     day = 1
#     arr = []
#     until day == 365
#     fri = t + (60*60*24*day)
#     if fri.friday?
#         arr << fri.to_s[7..9]
#     end
#     day += 1
#     end
#     arr.count('-13')
# end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

=begin
A featured number (something unique to this exercise) is an odd number that is
a multiple of 7, and whose digits occur exactly once each. So, for example, 49
is a featured number, but 98 is not (it is not odd), 97 is not (it is not a
multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, 
and returns the next featured number that is greater than the argument. 
Issue an error message if there is no next featured number.

-odd number?
-multiple of 7?
-each digit occurs once

check if number is error
return the next multiple of 7
if it's even, go to the next multiple of 7
if it's odd, check that each digit occurs once
=end

# def next_seven(int)
#     counter = 1
#     loop do
#     break if (int + counter) % 7 == 0
#     counter += 1
#     end
#     counter + int
# end

# def each_digit_once?(num)
#     arr = num.digits
#     if arr.size == arr.uniq.size
#         true
#     else
#         false
#     end
# end

# def featured(int3)
#     final_num = next_seven(int3)
#     if final_num.odd? && each_digit_once?(final_num)
#         final_num
#     elsif final_num > 9_876_543_210
#         'error'
#     else
#         featured(final_num)
#     end
# end

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987
# p featured(9_999_999_999)

=begin
Write a method that takes an Array as an argument, 
and sorts that Array using the bubble sort algorithm as just described.
Note that your sort will be "in-place"; that is, y
ou will mutate the Array passed as an argument. 
You may assume that the Array contains at least 2 elements.
=end

# def bubblesort!(arr)
#     loop do
#         swapped = false
#         counter = 0
#         until counter == arr.size - 1
#         if arr[counter] > arr [counter + 1]
#             arr[counter] , arr [counter + 1] = arr[counter + 1], arr[counter]
#             swapped = true
#         end
#         counter += 1
#         end
#         break if swapped == false
#     end
#     arr
# end

# p bubblesort!( %w(Sue Pete Alice Tyler Rachel Kim Bonnie))

=begin
Write a method that computes the difference between the square of the sum 
of the first n positive integers and the sum of the squares of the first n 
positive integers.

Examples:

sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
   36 - 15
 
=end

# def sum_square_difference(int)
#     arr = []
#     until int == 0
#     arr << int
#     int -= 1
#     end
#     squares_arr = arr.map {|x| x**2}
#     arr.sum**2 - squares_arr.sum
# end

# p sum_square_difference(3)
# p sum_square_difference(10) == 2640
# p sum_square_difference(1) == 0
# p sum_square_difference(100) == 25164150

=begin
you have a dictionary of letters that can only be used once in a word
the input is the word, the output is a boolean
if the word can be build without repeating an element in the dictionary, then
true, otherwise false
1 make the dictionary
2 for each element in the word, change status of dictionary element
if a dictionary element is used twice, then return fasle
else true
=end

dict = {  => 'free',  
['X', 'K'] => 'free'}
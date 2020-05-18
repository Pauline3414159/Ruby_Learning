# Write a method that takes two strings as arguments,
# determines the longest of the two strings, and then 
# returns the result of concatenating the shorter string, the longer string,
# and the shorter string once again. You 
# may assume that the strings are of different lengths.

# Examples:



# def short_long_short(tests, longer)
#   short = nil
#   long = nil
#   if tests.size < longer.size
#     short = tests 
#     long = longer
#   else
#     short = longer 
#     long = tests
#   end
#   short + long + short
# end

# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"

# Write a method that takes a year as input and returns the century.
# The return value should be a string that begins with the century number,
# and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. 
# So, the years 1901-2000 comprise the 20th century.

# Examples:

# 01*st
# 02*nd
# 03*rd
# 04
# 05
# 06
# 07
# 08
# 09
# 10
# 11--special exceptions th
# 12
# 13

# if last digit is 1,2,3 then st, nd, rd unless 11, 12, or 13, otherwize th

# def century(year)
#   cent = nil
#   posts = nil
#   years = year.divmod(100)
#   posthash = {'01'=> 'st', '02' => 'nd', '03'=> 'rd', 
#   '11'=> 'th', '12'=>'th','13' => 'th', 
#   '21' => 'st', '22' => 'nd', '23' => 'rd',
#   '31' => 'st', '32' => 'nd', '33' => 'rd',
#   '41' => 'st', '42' => 'nd', '43' => 'rd',
#   '51' => 'st', '52' => 'nd', '53' => 'rd',
#   '61' => 'st', '62' => 'nd', '63' => 'rd',
#   '71' => 'st', '72' => 'nd', '73' => 'rd',
#   '81' => 'st', '82' => 'nd', '83' => 'rd',
#   '91' => 'st', '92' => 'nd', '93' => 'rd',
#   }
#   if years[1].between?(1,99)
#     cent = years[0] + 1
#   else
#     cent = years[0]
#   end
#   if posthash.has_key?(cent.to_s.chars.last(2))
#     posts = posthash[cent.to_s.chars.last(2)]
#   else
#     posts = 'th'
#   end
#   cent.to_s + posts
# end

# p century(2000) == '20th'
# p century(2001) == '21st'
# p century(1965) == '20th'
# p century(256) == '3rd'
# p century(5) == '1st'
# p century(10103) == '102nd'
# p century(1052) == '11th'
# p century(1127) == '12th'
# p century(11201) == '113th'

# In the modern era under the Gregorian Calendar, 
# leap years occur in every year that is evenly divisible by 4,
# unless the year is also divisible by 100. If the year is evenly 
# divisible by 100, then it is not a leap year unless the year 
# is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0.
# Write a method that takes any year greater than 0 as input,
# and returns true if the year is a leap year, or
# false if it is not a leap year.

# problem
# take an integer and find out if it is a leap year

# exampes
# leap_year?(2016) == true
# leap_year?(2015) == false
# leap_year?(2100) == false
# leap_year?(2400) == true
# leap_year?(240000) == true
# leap_year?(240001) == false
# leap_year?(2000) == true
# leap_year?(1900) == false
# leap_year?(1752) == true
# leap_year?(1700) == false
# leap_year?(1) == false
# leap_year?(100) == false
# leap_year?(400) == true

# data structure
# in put is a postive integer
# out put is a boolean of true or false

# algorythim 2
# check if year is divisible by 4
#   if no, then false
#   check if year is divisble by 100 
#     if it is, check if the year is divisble by 400
#       if so, true
#     otherwise false
    
# code'

# def leap_year?(year)
# by4 = nil
# by100 = nil
# by400 = nil

# if year % 4 == 0
#   by4 = true
# else
#   by4 = false
# end

# if year % 100 == 0
#   by100 = true
# else
#   by100 = false
# end

# if year % 400 == 0
#   by400 = true
# else
#   by400 = false
# end

# if by4 == false
#   false
# elsif by4 == true && by100 == true && by400 == false
#   false
# elsif by4 == true && by100 == true && by400 == true
#   true
# elsif by4 == true && by100 == false
#   true
# end
# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true

# The British Empire adopted the Gregorian Calendar in 1752,
# which was a leap year. Prior to 1752, the Julian Calendar was used. 
# Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

# Using this information, update the method from the previous
# exercise to determine leap years both before and after 1752.

# def leap_year?(year)
#   if year <= 1795
#     if year % 4 == 0
#       true
#     else
#       false
#     end
#   elsif year > 1795
#     if year % 400 == 0
#       true
#     elsif year % 100 == 0
#       false
#     else
#       year % 4 == 0
#     end
#   end
# end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == true
# p leap_year?(1) == false
# p leap_year?(100) == true
# p leap_year?(400) == true

# Write a method that searches for all 
# multiples of 3 or 5 that lie between 1 
# and some other number, and then computes
# the sum of those multiples. For instance, 
# if the supplied number is 20,
#   the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in 
# is an integer greater than 1.

# problem 
# find the mulitpiles of 3 and 5 bewtween 1 and a postive integer of user choice
# if a number is a multiple of both 3 and 5, then it's only in there once
# return the sum of all of these multiples'

# Examples

# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168

# data
# input is integer
# add to an  array
# output the sum of array

# algorythim
# find the multiples of 3 and 5 between 1 and num
# take this and push it to array
# return sum of array

# def multisum(num)
#   arr = []
#   1.upto(num) {|ele|
#     if ele % 5 == 0 || ele % 3 == 0
#       arr << ele
#     end}
#   arr.sum
# end

# multisum(20)

# p multisum(3) == 3
# p multisum(5) == 8
# p multisum(10) == 33
# p multisum(1000) == 234168

# Write a method that takes an Array of numbers
# , and returns an Array with the same number of elements, 
# and each element has the running total from the original Array.

# problem
# take an array of numbers with x elements of numbers
# transform it into a new array with x elements,
# each element has a running total from the original array

# Examples:

# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

# data
# input of an array of x numbers
# out put of an array of x numbers

# algorythim
# copy the first element into the second array
# add the second element of the first array to the first element of the first array
# put the answer into the second arry in the second element
# take the second element of the second array and add it to the third element of the first array
# put the answer into the second array in the third element
# until 
# 0, (0+1), 1+2, 2+3

# def running_total(arr1)
#   arr2 = []
#   arr1.size = limit
#   if limit == 0
#     arr2
#   elsif limit == 1
#     arr2 = arr1
#   else
#     arr1.each do |num|
      
# end

# The String#to_i method converts a string of numeric characters
# (including an optional plus or minus sign) to an Integer.
# String#to_i and the Integer constructor (Integer()) behave similarly.
# In this exercise, you will create a method that does the same thing.
# Write a method that takes a String of digits,
# and returns the appropriate number as an integer. 
# You may not use any of the methods mentioned above.
# For now, do not worry about leading + or - signs, 
# nor should you worry about invalid characters; assume all
# characters will be numeric.
# You may not use any of the standard conversion methods available 
# in Ruby, such as String#to_i, Integer(), etc.
# Your method should do this the old-fashioned way
# and calculate the result by analyzing the characters in the string.

# Examples

# def string_to_signed_integer(string)
#   postive = nil
#   numhsh = { '0' => 0 , '1' => 1, '2'=>2, '3'=> 3, '4'=> 4, '5'=>5, '6'=> 6, '7'=>7, '8'=> 8, '9'=> 9}
#   if string.chars.first == '+'
#     postive = true
#     string.delete_prefix!('+')
#   elsif string.chars.first == ('-')
#     postive = false
#     string.delete_prefix!('-')
#   else
#     postive = true
#   end
#   arr = string.chars.map do |num|
#     numhsh[num]
#   end
#   counter = arr.size
#   tens = 1
#   sum = 0
#   loop do
#     sum += (arr[counter-1] * tens)
#     counter -= 1
#     tens = tens * 10
#     break if counter == 0
#   end
#   if postive == true
#   sum
#   elsif postive == false
#   sum * -1
#   end
# end

  
# p string_to_signed_integer('4321') == 4321
# p string_to_signed_integer('-570') == -570
# p string_to_signed_integer('+100') == 100

# In the previous two exercises, you developed 
# methods that convert simple numeric strings to 
# signed Integers. In this exercise and the next,
# you're going to reverse those methods.

# Write a method that takes a positive
# integer or zero, and converts it to a 
# string representation.

# You may not use any of the standard conversion 
# methods available in Ruby, such as Integer#to_s, 
# String(), Kernel#format, etc. Your method should do 
# this the old-fashioned way and construct the string 
# by analyzing and manipulating the number.

# Examples

ITGHSH = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'}

def integer_to_string(int)
  arr = int.digits.map do |digit|
    ITGHSH[digit]
  end
  arr.reverse.join
end

# p integer_to_string(4321)

# p integer_to_string(4321) == '4321'
# p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'

def signed_integer_to_string(ooo)
  if ooo > 0
    sign = '+'
  elsif ooo < 0
    sign = '-'
  else
    sign = ' '
  end
  sign + integer_to_string(ooo)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
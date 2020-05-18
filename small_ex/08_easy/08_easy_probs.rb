# def sum_of_sums(arr)
#   result = []
#   y = arr.size
#   arr.each do |num|
#     result << num * y
#     y -= 1
#   end
#   result.sum
# end

# p sum_of_sums([4,5])

# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

# Write a method that returns a list of all
# substrings of a string that start at the beginning 
# of the original string. The return value should be 
# arranged in order from shortest to longest substring.

# Examples:

# input is a string of n chars
# output is an array of strings with n number of elements
# with the shortest string in the first index and the largest in the last index

# algorythm

# make an empty array
# take the string and make it into array
# add the n element into the empty array
# add the n and concat with the n+1 element and add that to the second
#   element of the next array
#   etc until you have reached the end
  
# def substrings_at_start(string)
#   ans = []
#   counter = string.length
#   loop do
#     ans << string.slice(0..counter-1)
#     counter -= 1
#     break if counter == 0
#   end
#   ans.reverse
# end

# p substrings_at_start('abc') == ['a', 'ab', 'abc']
# p substrings_at_start('a') == ['a']
# p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# Write a method that returns a list of all substrings of a string. 
# The returned list should be ordered by where in the string 
# the substring begins. This means that all substrings that 
# start at position 0 should come first, then all substrings
# that start at position 1, and so on. Since multiple substrings 
# will occur at each position, the substrings at a given position 
# should be returned in order from shortest to longest.

# You may (and should) use the substrings_at_start method
# you wrote in the previous exercise:

# Examples:
# input is a string, output is an array of strings

# iterate thru each char in the string
# use the previous method to get array for that char
# add it to the answer array

def substrings_at_start(string)
  ans = []
  counter = string.length
  loop do
    ans << string.slice(0..counter-1)
    counter -= 1
    break if counter == 0
  end
  ans.reverse!
end

def substrings(string)
  arr = string.chars
  ans = []
  arr.size.times do 
    ans << substrings_at_start(arr.join)
    arr.delete_at(0)
  end
  ans.flatten
end

#p substrings_at_start('abcd')
substrings('abcd')
substrings_at_start('abcde')


substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# Write a method that returns a list of all substrings of a 
# string that are palindromic. That is, each substring must 
# consist of the same sequence of characters forwards as it 
# does backwards. The return value should be arranged in the
# same sequence as the substrings appear in the string. 
# Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wr
# ote in the previous exercise.

# For the purposes of this exercise, you should consider 
# all characters and pay attention to case; that is, 
# "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA"
# are. In addition, assume that single characters are not palindromes.

# input is a string, output is an array of strings that are palidromes

# # use the method to get an array of strings
# check to see if any elements are equal to any other elements
# if so, add that to the asnsewr array


# def substrings_at_start(string)
#   ans = []
#   counter = string.length
#   loop do
#     ans << string.slice(0..counter-1)
#     counter -= 1
#     break if counter == 0
#   end
#   ans.reverse!
# end

# def substrings(string)
#   arr = string.chars
#   ans = []
#   arr.size.times do 
#     ans << substrings_at_start(arr.join)
#     arr.delete_at(0)
#   end
#   ans.flatten
# end

# def palindrome?(string)
#   string == string.reverse && string.size > 1
# end

# def palindromes(string)
#   arr = substrings(string)
#   ans = []
#   arr.each do |ele|
#     ans << ele if palindrome?(ele)
#   end
#   ans
# end

# p palindromes('knitting cassettes')

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# Write a method that takes two arguments: 
# the first is the starting number, 
# and the second is the ending number. 
# Print out all numbers between the two numbers, 
# except if a number is divisible by 3, print "Fizz", 
# if a number is divisible by 5, print "Buzz",
# and finally if a number is divisible by 3 and 5,
# print "FizzBuzz".

# input is 2 integers, output is string of either 
# the incrimented input or fizz or buzz or fizzbuzz

# write helper methods for divisble by 3, 5
# check each number to see if it is deivisble
# if not, print that number, otherwise fizz or 
# buzz as appropraite

# def divisble_by_three?(int)
#   if int % 3 == 0
#     true
#   end
# end

# def divisble_by_five?(int)
#   if int % 5 == 0
#     true
#   end
# end

# def divisible_by_five_and_three(int)
#   if divisble_by_five?(int) && divisble_by_three?(int)
#     true
#   end
# end


# def fizzbuzz (startnum, endnum)
#   startnum.upto(endnum) { |num|
#     if divisible_by_five_and_three(num)
#       puts "FizzBuzz"
#     elsif divisble_by_five?(num)
#       puts 'Buzz'
#     elsif divisble_by_three?(num)
#       puts 'Fizz'
#     else
#       puts num
#     end}

# end


# p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# Write a method that takes a string, and returns a new string in which every character is doubled.

# Examples:

# Input is a string, the output is a string with every char doubled
# copy each char into a new array twice,
# then join the array and return in

# def repeater(string)
#   arr = string.chars
#   ans = []
#   arr.each do |char|
#     ans << char
#     ans << char
#   end
#   ans.join
# end


# Write a method that takes a string, and
# returns a new string in which every consonant 
# character is doubled. Vowels (a,e,i,o,u), digits, 
# punctuation, and whitespace should not be doubled.

# Examples:

# check each char
# if char is a constant, add it to answer twice
# if not, just add it once

# def double_consonants(string)
#   ans = ''
#   string.each_char do |char|
#     if char =~ /[^aiueoAIUEO0-9\W]/
#       ans << char << char
#     else
#       ans << char
#     end
#   end
#   ans
# end
# p double_consonants('July 4th')
# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""

# Write a method that takes a positive integer as 
# an argument and returns that number with its digits reversed.
# Examples:
# input is a postive integer, so is the output

# turn number to string
# use reverse
# to i

# def reversed_number(num)
#   num.to_s.reverse.to_i
# end

# p reversed_number(12345) == 54321
# p reversed_number(12213) == 31221
# p reversed_number(456) == 654
# p reversed_number(12000) == 21 # No leading zeros in return value!
# p reversed_number(12003) == 30021
# p reversed_number(1) == 1

# Write a method that takes a non-empty string argument, 
# and returns the middle character or characters of the argument.
# If the argument has an odd length, you should return exactly one character. 
# If the argument has an even length, you should return exactly two characters.

# input is a string, output is one or two chars

# if string length is odd, return string/2 char round down
# if string length is even, return string/2 and string/2-1
#   abcd

# def center_of(string)
#   y = (string.length/2).to_i
#   if string.length.odd?
#     string.slice(y)
#   elsif string.length.even?
#     string.slice(y-1 .. y)
#   end
# end

# p center_of('I love ruby') == 'e'
# p center_of('Launch School') == ' '
# p center_of('Launch') == 'un'
# p center_of('Launchschool') == 'hs'
# p center_of('x') == 'x'
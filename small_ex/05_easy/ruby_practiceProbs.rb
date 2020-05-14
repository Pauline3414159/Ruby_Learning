# Write a method that determines and returns the 
# ASCII string value of a string that is passed 
# in as an argument. The ASCII string value is 
# the sum of the ASCII values of every character
# in the string. (You may use String#ord to determine
# the ASCII value of a character.)

# def ascii_value(string)
#   arr = string.chars
#   arr2 = arr.map do |char|
#     char.ord
#   end
#   arr2.sum
# end

# p ascii_value('bb')

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

# The time of day can be represented a
# s the number of minutes before or after midnight.
# If the number of minutes is positive, the time is
# after midnight. If the number of minutes is
# negative, the time is before midnight.

# Write a method that takes a time using
# this minute-based format and returns
# the time of day in 24 hour format (hh:mm). 
# Your method should work with any integer input.

# You may not use ruby's Date and Time classes.

# Examples:

# def time_of_day(mins)
#   arrh = Array.new(24){|i| i += 1}
#   arrh.unshift(0)
#   arrh.pop
#   arrm = Array.new(60){|i| i += 1 }
#   arrm.unshift(0)
#   arrm.pop
#   time = mins.divmod(60)
#   if time[0].abs > 24
#     arr24 = time[0].divmod(24)
#     time[0] = arr24[1]
#   end
#   sprintf("%02d","#{arrh[time[0]]}")+':'+ sprintf("%02d", "#{arrm[time[-1]]}" )
# end
 

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

# As seen in the previous exercise,
# the time of day can be represented
# as the number of minutes before or 
# after midnight. If the number of 
# minutes is positive, the time is 
# after midnight. If the number of 
# minutes is negative, the time is before
# midnight.

# Write two methods that each take 
# a time of day in 24 hour format, 
# and return the number of minutes 
# before and after midnight, respectively. 
# Both methods should return a value 
# in the range 0..1439.

# You may not use ruby's Date and Time methods.

# Examples:


# def after_midnight(timestring)
#   hours = timestring.slice(0..1).to_i
#   mins = timestring.slice(3..4).to_i
#   hours = hours * 60
#   ans = hours + mins
#   if ans > 1439
#     ans = 0
#   end
#   ans
# end

# def before_midnight(timestring)
#   hours = timestring.slice(0..1).to_i
#   mins = timestring.slice(3..4).to_i
#   total = hours * 60 + mins
#   ans = 1440 - total
#   if total == 0
#     total
#   else
#     ans
#   end
# end



# p after_midnight('00:00') == 0
# p before_midnight('00:00') == 0
# p after_midnight('12:34') == 754
# p before_midnight('12:34') == 686
# p after_midnight('24:00') == 0
# p before_midnight('24:00') == 0

# Given a string of words separated by spaces,
# write a method that takes this string of words 
# and returns a string in which the first and
# last letters of every word are swapped.

# You may assume that every word contains 
# at least one letter, and that the string 
# will always contain at least one word. 
# You may also assume that each string contains n
# othing but words and spaces

# Examples:

# def swap(string_of_words)
#   arr = string_of_words.split(" ")
#   arr.map! do |word|
#     word.chars
#   end
#   arr.map! do |word|
#     lstltter = word.last
#     fstltter = word.first
#     word[0] = lstltter
#     word[word.size-1] = fstltter
#     word.join
#   end
#   arr.join(" ")
# end

# p swap('This is a best')

# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'

# Given a string that consists of some words
# (all lowercased) and an assortment of non-alphabetic
# characters, write a method that returns that string 
# with all of the non-alphabetic characters replaced by 
# spaces. If one or more non-alphabetic characters occur
# in a row, you should only have one space in the result
# (the result should never have consecutive spaces).

# Examples:

# def cleanup(string)
#   string.gsub!(/[^\sa-z]/," ").squeeze(" ")
# end

# p cleanup('!!!te st')
# p cleanup("---what's my +*& line?")
# p cleanup("---what's my +*& line?") == ' what s my line '

# Write a method that takes a string 
# with one or more space separated 
# words and returns a hash that shows
# the number of words of different sizes.

# Words consist of any string of 
# characters that do not include a space.

# Examples

#require 'pry'
# def word_sizes(string)
#   string.gsub!(/[^\sa-zA-Z]/, '')
#   arr = string.split(" ")
#   arr.map! do |word|
#     word.size
#   end
#   hsh = {}
#   arr.each do |size|
#     if hsh.has_key?(size)
#     hsh[size] += 1
#     else
#       hsh[size] = 1
#     end
#   end
#   hsh
#   #binding.pry
# end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p word_sizes('') == {}

# Write a method that takes an Array of 
# Integers between 0 and 19, and returns
# an Array of those Integers sorted based 
# on the English words for each number:

# algorythem
# make array of integers 0 - 19             array
# convert each number into a string         convert into new array using hash lookup
# sort the strings                          array sort
# now put the strings back into integers   change the hash around then use it to map a new array

# arr = Array.new(20){|i|i}

# def alphabetic_number_sort(array)
# hsh = {0 => 'zero', 1	=> 'one', 2	=> 'two', 3	=> 'three', 4	=> 'four',
#       5	=> 'five', 6	=> 'six', 7	=> 'seven', 8	=> 'eight', 9	=> 'nine',
#       10 =>	'ten', 11 =>	'eleven', 12 =>	'twelve', 13 =>	'thirteen',
#       14 =>	'fourteen', 15 =>	'fifteen', 16 =>	'sixteen', 17 =>	'seventeen',
#       18 =>	'eighteen', 19 =>	'nineteen'}
# strng_arr = array.map do |i|
#   hsh[i]
# end
# ans= strng_arr.sort.map do |i|
#   hsh.invert[i]
# end
# ans
# end

# p alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

# Write a method that takes a string argument
# and returns a new string that contains the 
# value of the original string with all 
# consecutive duplicate characters collapsed 
# into a single character. You may not use
# String#squeeze or String#squeeze!.

# check the string to see if the next character
# matches the previous charachter
# if not, contuie
# if it does match, then count the number of duplicate
# charachters.
# delete total count of ( that charchter - 1)
# until end of string is reached

# Examples:

# test = [6,9,0]
# b = 1
# test.delete_at(b+1)
# p test
# require 'pry'
# test = 'thisss is a test'
# arr = test.chars
# size = test.size
# counter = 0
# loop do
#   break if counter == size
#     if arr[counter] == arr[counter - 1]
#       arr.delete_at(counter)
#     end
#       counter += 1
   
#   #binding.pry
  
#   end
# p  arr.join



# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''


def print_in_box(string)
  a = string
  sizeone = a.size
  a.prepend('| ')
  a = a + ' |'
  inbetween = '|' + (" " * (sizeone + 2)) + '|'
  top = '+' + ('-' * (sizeone + 2)) + '+'
  puts top
  puts inbetween
  puts a
  puts inbetween
  puts top
end

p print_in_box('To bodly go')
# Write a method that takes a 
# floating point number that 
# represents an angle between 0 and 360 
# degrees and returns a String that represents 
# that angle in degrees, minutes and seconds. 
# You should use a degree symbol (°) to represent degrees, 
# a single quote (') to represent minutes, and a double quote (") 
# to represent seconds. A degree has 60 minutes, 
# while a minute has 60 seconds.
# Note: your results may differ slightly depending 
# on how you round values, but should be within a 
# second or two of the results shown.

# You should use two digit numbers with
# leading zeros when formatting the minutes a
# nd seconds, e.g., 321°03'07".

# You may use this constant to represent the degree symbol:

# DEGREE = "\xC2\xB0"

# def dms(float)
#   x = float
#   y = x.modulo(1)
#   deg = (x - y).to_i
#   min = 60 * y
#   z = min.modulo(1)
#   seconds = (60 * z).to_i
#   sprintf("%3d", deg) + DEGREE + sprintf("%02d", min) + "'" + sprintf("%02d", seconds) + ""
# end



# p dms(30) # == %(30°00'00")
# p dms(76.73) #== %(76°43'48")
# p dms(254.6) #== %(254°36'00")
# p dms(93.034773)# == %(93°02'05")
# p dms(0)# == %(0°00'00")
# p dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")

# Write a method that takes an array of strings,
# and returns an array of the same string values, 
# except with the vowels (a, e, i, o, u) removed.

# # Example:
# def remove_vowels(strngarr)
#   test = strngarr
#   test.each do |ele|
#     ele.gsub!(/[aeuioAEUIO]/,"")
#   end
#   test
# end


# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) 
# such that the first 2 numbers are 1 by definition, and each subsequent 
# number is the sum of the two previous numbers. This series appears throughout the natural world.

# Computationally, the Fibonacci series is a very simple series
# but the results grow at an incredibly rapid rate. For example, 
# the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's
# enormous, especially considering that it takes 6 iterations
# before it generates the first 2 digit number.

# Write a method that calculates and returns the 
# index of the first Fibonacci number that has the number of 
# digits specified as an argument. (The first Fibonacci number has index 1.)
# You may assume that the argument is always greater than or equal to 2.


# arr = [1,1,10,100,1000]
# #p 1000.digits.size
# def find_the_place (place,constarr)
#   constarr.map! do |ele|
#     ele.digits.size
#   end
#   constarr.find_index(place) + 1
# end

# p find_the_place(2,arr)

# def fib(n)
# 	if (n<=2)
# 		return 1
# 	else
# 		return (fib(n-1)+fib(n-2))
# 	end
# end
# p fib(9)

# Examples:

# find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847

# Write a method that takes an Array as an argument,
# and reverses its elements in place; that is, mutate
# the Array passed into this method. The return value 
# should be the same Array object.

# arr = [7,8,4,3,1]

# arr[-1] = arr [0]
# p arr

# Write a method that takes an Array,
# and returns a new Array with the elements 
# of the original list in reverse order. 
# Do not modify the original list.

# You may not use Array#reverse or Array#reverse!
# , nor may you use the method you wrote in the previous exercise.

# arr = [1,2,3,5]
# arr2 = []
# counter = arr.size
# loop do
#   arr2 << arr[counter-1]
#   counter -=1
#   break if counter == 0
# end
# p arr2

# Write a method that takes two Arrays as arguments, 
# and returns an Array that contains all of the values 
# from the argument Arrays. There should be no duplication 
# of values in the returned Array, even if there are duplicates 
# in the original Arrays.

# Example

# def merge (arr1, arr2)
#   (arr1 + arr2).uniq
# end

# p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# Write a method that takes an Array as an argument, 
# and returns two Arrays (as a pair of nested Arrays)
# that contain the first half and second half of the 
# original Array, respectively. If the original array c
# ontains an odd number of elements, the middle element
# should be placed in the first half Array.

# Examples:
# def halvsies(arr)
# if arr.size.odd?
#   h = arr.size/2.round(half: :up)
#   new_arr = []
#   new_arr[0] = arr.values_at(0..h)
#   new_arr[1] = arr.values_at(h+1 .. arr.size-1)
#   new_arr
# else
#   h = arr.size/2.to_i
#   new_arr = []
#   new_arr[0] = arr.values_at(0..h-1)
#   new_arr[1] = arr.values_at(h .. arr.size-1)
#   new_arr
# end
# end

# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]

# Given an unordered array and the information
# that exactly one value in the array occurs twice
# (every other value occurs exactly once), how would 
# you determine which value occurs twice? Write 
# a method that will find and return the duplicate
# value that is known to be in the array.

#compare arr vs arr.uniq
#find the difference, return the index


# def find_dup(arr)
#   arr.map! do |ele|
#     if arr.count(ele) == 2
#       ele
#     end
#   end
#   arr.compact.uniq.join.to_i
# end

# p find_dup([1, 5, 3, 1]) == 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# Write a method named include? that takes an Array and
# a search value as arguments. This method should return 
# true if the search value is in the array, false if it is not. 
# You may not use the Array#include? method in your solution.

# check each search value against each element
# if any are equal, return true
# othewise false

# arr = [1,2,5,5,6]
# search = 4

# p arr.each do |ele|
#   if ele == search
#     true
#     break
#   else
#     false
#   end
# end

# def include?(arr, search)
#   if arr.count(search) == 1
#     true
#   else
#     false
#   end
# end

# p include?([1,2,3,4,5], 3)

# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

# def triangle(int)
#   y = 1
#   until y > int
#     string = " " * (int - y) + "*" * y
#     puts string
#     y +=1
#   end
# end

# triangle(5)
# triangle(10)


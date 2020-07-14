=begin
Write a method that rotates an array by moving the first element to the end of
the array. The original array should not be modified.
Do not use the method Array#rotate or Array#rotate! for your implementation.

input is an array and the output is an array. don't modify the first array
take the first element and add it to the end of the array
=end

# def rotate_array (arr)
#   arr2 = arr.clone
#   x = arr2.shift
#   arr2 << x
#   arr2
# end

=begin
Write a method that can rotate the last n digits of a number. For example:
the input is a number and the output is a number
take the digits and turn it into an array 
take just the last n elements of an array and use the rotate array method on it
then add the two arrays
join them together
=end

# def rotate_rightmost_digits(number, n)
#   arr = number.digits.reverse
#   arr2 = []
#   n2 = n.clone
#     n.times do
#       arr2 << arr[-n]
#       n -= 1
#     end
#   arr2 = rotate_array(arr2)
#     n2.times do
#       arr.pop
#     end
#   arr =arr + arr2
#   arr.join.to_i
# end

# p rotate_rightmost_digits(735291, 3)

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

=begin
If you take a number like 735291, and rotate it to the left, you get 352917.
If you now keep the first digit fixed in place, and rotate the remaining digits
, you get 329175. Keep the first 2 digits fixed in place and rotate again
to 321759. Keep the first 3 digits fixed in place and rotate again to get 
321597. Finally, keep the first 4 digits fixed in place and rotate the final 
2 digits to get 321579. The resulting number is called the maximum rotation
of the original number.

Write a method that takes an integer as argument, and returns the 
maximum rotation of that argument. You can (and probably should) use the
rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

take the integer
send it thru rotate r digits with integer.digits.size as second argument
then send that number thru the method with size - 1 as the argument
=end

# def max_rotation(number)
#   n = number.digits.size
#   loop do
#     number = rotate_rightmost_digits(number, n)
#     n -= 1
#     break if n == 0
#   end
#   number
# end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

=begin


You have a bank of switches before you, numbered from 1 to n. Each switch is
connected to exactly one light that is initially off. You walk down the row of
switches and toggle every one of them. You go back to the beginning, and on this
second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go
back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat
this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and
returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

    round 1: every light is turned on
    round 2: lights 2 and 4 are now off; 1, 3, 5 are on
    round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
    round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
    round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

The result is that 2 lights are left on, lights 1 and 4. 
The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. 
The return value is [1, 4, 9].

make a helper method called toggle that will take two arguments, the key 
and value. it will toggle the value from off to on or from on to off

create a hash of n key value pairs wiht the key being the index + 1
(so we start at one) and the value is 'off'

counter is set to 1 
for the counter round, every key that is = counter +=counter should be toggled

write helper method that takes two arguments, r is the round, l is the lights
, it returns an array with n, n+n, n +n +n, until the end of array

counter is incremented by 1 and a new round is completed until counter == n
then return an array of keys were all of the values are == on


=end

# def what_lights_to_toggle (round, lights)
#   arr1 = Array.new(lights-1){|i| i + 1}
#   arr2 = []
#   arr1.each do |ele|
#     if ele % round == 0
#       arr2 << ele
#     end
#   end
#   arr2
# end

# def toggle(value)
#   if value == 'on'
#     value = 'off'
#   elsif value == 'off'
#     value = 'on'
#   end
# end

# def lights_round(lights)
#   light_arr1 = Array.new(lights){|i| i+1}
#   light_status = light_arr1.to_h {|i| [i, 'off']}
#   counter = 1
#   until counter == lights
#     light_status.each do |key,value|
#       if what_lights_to_toggle(counter,lights).include?(key)
#         light_status[key] = toggle(value)
#       end
#     end
#     counter += 1
#   end
#   light_status.keep_if {| _ , value| value == 'on'}.keys
# end

# p lights_round(100)

=begin
Write a method that displays a 4-pointed diamond in an n x n grid, where n 
is an odd integer that is supplied as an argument to the method.
You may assume that the argument will always be an odd integer.

each line has n chars
the first line has 1 centered star
the second line has 3 stars up until n stars
then same thing is printed but reverse
* center (n)

=end

# def diamonds!(number)
#   counter = 1
#   until counter > number 
#     puts ("*" * counter).center(number)
#     counter += 2
#   end
# counter -= 4
#   until counter < 1
#     puts ("*" * counter).center(number)
#     counter -= 2
#   end
# end

# diamonds!(5)

=begin

    n Place a value n in the "register". Do not modify the stack.
    PUSH Push the register value on to the stack. Leave the value in the register.
    ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
    SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
    MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
    DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
    MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
    POP Remove the topmost item from the stack and place in register
    PRINT Print the register value
=end

=begin
Write a method that takes a sentence string as input, and returns the same 
string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 
'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.
input is a string, output is a string

have a hash of words as keys and digits as values
take the string and split it into an array
check to see if the element is a key in the hash
if it is, then replace the element with the appropriate value in the hash
otherwise, leave the element alone
then, join the array back to a string
=end

# def word_to_digit(string)
#   alphanumeric_spellings = {
#     'one'=> 1,
#     'two'=> 2,
#     'three'=> 3,
#     'four'=> 4,
#     'five'=> 5,
#     'six' => 6,
#     'seven'=> 7,
#     'eight'=> 8,
#     'nine'=> 9,
#     'zero'=> 0
#   }
#   arr = string.split
#   arr.map! do |word|
#     if alphanumeric_spellings.keys.include?(word)
#       word = alphanumeric_spellings[word]
#     else
#       word
#     end
#   end
#   arr.join(" ")
# end

# p word_to_digit("This is four tests")
# p word_to_digit('Please call me at five five five one two three four. Thanks.') 
# p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# def fibonacci(n)
#     return 1 if n == 1
#     return 1 if n == 2
#     fibonacci(n - 1) + fibonacci(n - 2)
# end

# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765

# def fibonacci(n)
#     arr = Array.new(n)
#     arr[0] = 1
#     arr[1] = 1
#     counter = 2
#     until counter == n
#       arr[counter] = arr[counter - 1] + arr[counter - 2]
#       counter += 1
#     end
#     arr[-1]
# end

# def fibonacci_last(n)
#     fibonacci(n).digits.reverse.pop
# end



#p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
#p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
#p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
#p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
#p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
#p fibonacci_last(123456789) # -> 4
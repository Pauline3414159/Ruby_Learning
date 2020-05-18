# def interleave(arr1, arr2)
#   arr3 = []
#   counter = 0
#   loop do
#     arr3 << arr1[counter]
#     arr3 << arr2[counter]
#     counter += 1
#     break if counter > arr1.size - 1
#   end
# arr3
# end

# p interleave([1,2,3], [5,5,5])

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# def letter_case_count(string)
#   hsh = { lowercase: 0, uppercase: 0, neither: 0}
#   arr = string.chars
#   arr.each do |let|
#     if let.match(/[^a-zA-Z]/)
#       hsh[:neither] += 1
#     elsif let.match(/[a-z]/)
#       hsh[:lowercase] += 1
#     elsif let.match(/[A-Z]/)
#       hsh[:uppercase] += 1
#     end
#   end
#   hsh
# end



# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# def word_cap(string)
#   arr = string.split(" ").map! do |word|
#     word.capitalize
#   end
#   arr.join(" ")
# end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# def swapcase (string)
#   arr = string.chars
#   arr.map do |let|
#     if let.match(/[A-Z]/)
#       let.downcase!
#     elsif let.match(/[a-z]/)
#       let.upcase!
#     end
#   end
#   arr.join
# end

# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# def staggered_case (string)
#   arr = string.split(" ")
#   arr.map! do |word|
#     word.chars.each_with_index do |let, index|
#       if index.even?
#         let.capitalize!
#       end
#     end
    
#   end
#   arr.map! do |word|
#     word.join
#   end
#   arr.join(" ")
# end

# def staggered_case(string)
#   result = ''
#   need_upper = true
#   string.chars.each do |char|
#     if need_upper
#       result += char.upcase
#     else
#       result += char.downcase
#     end
#     unless char.match(/[^a-zA-Z]/)
#     need_upper = !need_upper
#     end
#   end
#   result
# end

# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Write a method that takes an Array of integers as input,
# multiplies all the numbers together, divides the result by the number 
# of entries in the Array, and then prints the result rounded 
# to 3 decimal places. Assume the array is non-empty.

# def show_multiplicative_average(arr)
#   result = 1
#   arr.each do |num|
#     result *= num 
#   end
#   sprintf("%#.3f", result/arr.size.to_f )
  
# end


# p show_multiplicative_average([2, 5, 7, 11, 13, 17])

# def multiply_list (arr1, arr2)
#   results = []
#   counter = 0
#   loop do
#     results << arr1[counter] * arr2[counter]
#     counter +=1
#     break if counter == arr1.size
#   end
#   results
# end

# p multiply_list([3, 5, 7], [9, 10, 11])
#require 'pry'
# def multiply_all_pairs (arr1,arr2)
#   results = []
#   onecounter = 0
#   twocounter = 0
#   loop do
#     loop do
#       results << arr1[onecounter] * arr2[twocounter]
#       twocounter += 1
#       break if twocounter == arr2.size
#     end
#     twocounter = 0
#     onecounter += 1
#     #binding.pry
#     break if onecounter == arr1.size 
#   end
#   results.sort
# end

# p multiply_all_pairs([3,4],[5,5,5])
# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# def penultimate (string)
#   string.split[-2]
# end

# p penultimate("this is a test")

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'
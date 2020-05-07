#How would you order this array of number strings by descending numeric value?

# arr = ['10', '11', '9', '7', '8']
# arr.map! do |num|
#   num.to_i
# end
# arr.sort!.reverse!
# p arr

# How would you order this array of hashes based on the year of publication of each book,
# from the earliest to the latest?

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# a = books.sort_by do |book|
#   book[:published]
# end
# p a

#For each of these collection objects demonstrate how you would reference the letter 'g'.

# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# p arr1[2][1][3]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# p arr2[1][:third][0]

# arr3 = [['abc'], ['def'], {third: ['ghi']}]
# p arr3[2][:third][0][0]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# p hsh1['b'][1]

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# p hsh2[:third].key(0)

# For each of these collection objects where the value 3 occurs, 
# demonstrate how you would change this to 4.

# p arr1 = [1, [2, 3], 4]

# arr1.map! do |num|
#   if num.is_a?(Array)
#     num.map! do |x|
#       if x == 3
#         x = 4
#       else
#         x
#       end
#     end
#   elsif num == 3
#     num = 4
#   else
#     num
#   end
# end

# p arr1

# arr2 = [{a: 1}, {b: 2, c: [7, 3, 5], d: 4}, 3]

# arr2.map! do |outarr|
#   if outarr.is_a?(Hash)
#     outarr.each_value do |value|
#       if value.is_a?(Array)
#         value.map! do |e|
#           if e == 3
#             e = 4
#           else
#             e
#           end
#         end
#       elsif value == 3
#         value = 4
#       else
#         value
#       end
#     end
#   elsif outarr == 3
#     outarr = 4
#   else
#     outarr
#   end
# end
# p arr2

# hsh1 = {first: [1, 2, [3]]}
# #p hsh1[:first][2][0]

# hsh1.each do |_,value|
#   value.map! do |ele|
#     if ele.is_a?(Array)
#       ele.map! do |w|
#         if w == 3
#           w = 4
#         else
#           w
#         end
#       end
#     elsif ele == 3
#       ele = 4
#     else
#       ele
#     end
#   end
# end
# p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
# p hsh2.keys            #[["a"], "b"]
# p hsh2.values         #[{:a=>["1", :two, 3], :b=>4}, 5]
# p hsh2[["a"]]         #{:a=>["1", :two, 3], :b=>4}
# p hsh2[["a"]][:a][2]  #3

# hsh2.each_value do |value|
#   if value.is_a?(Hash)
#     value.each_value do |val2|
#       if val2.is_a?(Array)
#         val2.map! do |ele|
#           if ele == 3 
#             ele = 4
#           else
#             ele
#           end
#         end
#       elsif val2 == 3
#         val2 = 4
#       else
#         val2
#       end
#     end
#   elsif value == 3
#     value = 4
#   else
#     value
#   end
# end

# p hsh2

# Practice Problem 5

# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

#figure out the total age of just the male members of the family.

# munsters.reject! do |name, inhash|
#   inhash["gender"] == "female"
# end

# total_age = 0

# munsters.each do |name, inhash|
#   total_age += inhash["age"]
# end
# p total_age

# #p munsters["Herman"]["gender"] #"male"

# #p munsters

# One of the most frequently used real-world string properties is that of "string substitution", 
# where we take a hard-coded string and modify it with various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender of each family member:

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# # ...like this:

# # (Name) is a (age)-year-old (male or female).

# munsters.each do |name, detail|
#   puts "#{name} is a #{detail["age"]} year old #{detail["gender"]}."
# end

#Using the each method, write some code to output all of the vowels from the strings.

# hsh = {first: ['the', 'quick'], 
#     second: ['brown', 'fox'], 
#     third: ['jumped'], 
#     fourth: ['over', 'the', 'lazy', 'dog']}
    
# hsh.each_value do |value|
#   value.each do |ele|
#     ele.each_char do |c|
#       if c == 'a'|| c == 'e' || c == 'i' || c == 'u' || c == 'o'
#         puts c
#       end
#     end
#   end
# end

# Given this data structure, 
# return a new array of the same structure 
# but with the sub arrays being ordered 
# (alphabetically or numerically as appropriate) in descending order.

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
# arr.map! do |innarr|
#   innarr.sort!.reverse
# end


# p arr

# Given the following data structure and 
# without modifying the original array, 
# use the map method to return a new array identical 
# in structure to the original but where the value of
# each integer is incremented by 1.

# arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
# arr2 = arr.each do |hsh|
#   hsh.each do |k, v|
#     hsh[k] = v + 1
#   end
# end
# p arr
# p arr2

# Given the following data structure 
# use a combination of methods, 
# including either the select or reject method, 
# to return a new array identical in structure 
# to the original but containing only the integers 
# that are multiples of 3.

# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# arr2 = arr.map do |innarr|
#   innarr.select {|num| num % 3 == 0}
# end

# p arr2
# # p [3,4,5,6].select {|num| num % 3 == 0}

# Given the following data structure, and without using
# the Array#to_h method, write 
# some code that will return a hash where the key is the 
# first item in each sub array and the value is the second item.

# hsh = {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# newhsh = {}
# arr.map do |innarr|
#   key = innarr[0]
#   value = innarr[1]
#   newhsh[key] = value
# end
# p newhsh == hsh

# arr2 = ['a',4]
# hsh2 = {}
# hsh2[arr2[0]]=arr2[1]
# p hsh2

# Given the following data structure,
# return a new array containing the same 
# sub-arrays as the original but ordered 
# logically by only taking into consideration 
# the odd numbers they contain.
# The sorted array should look like this:

# arrend = [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# arr2 = arr.sort_by {|innar| innar.select {|e| e.odd?}}

# p arr

# p arr2 == arrend

# p arr.map do |innarr|
#   innarr.sort {|a , b|
#     b <=> a}
#   end

# Given this data structure write some code
# to return an array containing the colors of 
# the fruits and the sizes of the vegetables. 
# The sizes should be uppercase and the colors 
# should be capitalized.

# The return value should look like this:

# ans = [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }
# newarr = []
# hsh.each do |produce, details|
#   if details[:type] == 'fruit'
#     details[:colors].map! do |ele|
#       ele.capitalize
#     end
#     newarr << details[:colors]
#   elsif details[:type] == 'vegetable'
#     newarr << details[:size].upcase
#   end
# end
# p newarr == ans

# Given this data structure write some
# code to return an array which contains 
# only the hashes where all the integers are even.

# p arr[0] #  {:a=>[1, 2, 3]}
# p arr[1]  #  {:b=>[2, 4, 6], :c=>[3, 6], :d=>[4]}
# p arr[2]  #  {:e=>[8], :f=>[6, 10]}

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# arr.map! do |hsh1|
#   hsh1.keep_if {|key, valuearr| valuearr.all?{|e| e.even?}}
# end

# p arr

# A UUID is a type of identifier often used as a way to uniquely identify items
# ...which may not all be created by the same system. 
# That is, without any form of synchronization, two or 
# more separate computer systems can create new items and label 
# them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. 
# The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, 
# and is typically broken into 5 sections like this 8-4-4-4-12 a
# nd represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.
# def make_UUID
#   arr = []
#   32.times do
#     a = [0,1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f'].sample
#     arr << a
#   end
#   arr.insert(8, '-')
#   arr.insert(13, '-')
#   arr.insert(18, '-')
#   arr.insert(23, '-')
#   arr.join
# end

# test = make_UUID
# p test

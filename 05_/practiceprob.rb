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

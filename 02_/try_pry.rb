require 'pry'

number_one = nil
number_two = nil

puts 'Please enter a number.'
number_one = gets.chomp

if number_one.to_i.is_a? Integer
  binding.pry
  puts 'good'
end

puts 'Please enter a number'
number_two = gets.chomp

puts number_one, number_two
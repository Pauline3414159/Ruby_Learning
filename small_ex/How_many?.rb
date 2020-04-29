=begin
How Many?

Write a method that counts the number of occurrences of each element in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

The words in the array are case-sensitive: 'suv' != 'SUV'. 
` Once counted, print each element alongside the number of occurrences.

Expected output:

car => 4
truck => 3
SUV => 1
motorcycle => 2

input is an array of words
it is case sensitive

output is a print out with the frequencies of each repeated element

save the first element of the array
look at the next element 
if the element is ==, then incriment the counter for that element
if the element is !=, check to see if a counter exists
  if it does exist, add to that counter
  if it doesn't, make a new counter
then print out the results

=end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(ary)
  first_counter = ary[0]
  ary each do |x|
    if x == first_counter
      then first_counter += 1
    else
      second_counter == x
      
end 
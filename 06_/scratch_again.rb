#make an array
practice = Array.new(5) {|i| i += 1}
#turn it into hash with array as value with two elements in array
practice_hash = {}
practice.each do |num|
  if num.even?
    practice_hash[num] = ['even', 3]
  elsif num.odd?
    practice_hash[num] = ['odd',3]
  end
end


#select all keys that have tag 'even'

evens_hash = practice_hash.select {|num, arr| arr[0] == 'even'}

#update 3 to 6

evens_hash.each_value do |arr|
  arr[1] = 6
end

p evens_hash
p practice_hash
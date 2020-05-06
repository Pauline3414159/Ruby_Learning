def xor?(a, b)
  if a == true && b == true then false
  elsif a == false && b == true then true
  elsif a == true && b == false then true
  elsif a == false && b == false then false
  end
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

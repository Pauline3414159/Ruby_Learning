# Write a method that returns true if
# the string passed as an argument is a palindrome,
# false otherwise. A palindrome reads the same forward
# and backward. For this exercise, case matters as does
# punctuation and spaces.

# Examples:

# palindrome?('madam') == true
# palindrome?('Madam') == false          # (case matters)
# palindrome?("madam i'm adam") == false # (all characters matter)
# palindrome?('356653') == true

def real_palindrome?(string)
  string.delete!([" ", "'"].to_s)
  if string.casecmp?(string.reverse) == true
    true
  else
    false
  end
end

# p real_palindrome?('madam') == true
# p real_palindrome?('Madam') == true           # (case does not matter)
# p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# p real_palindrome?('356653') == true
# p real_palindrome?('356a653') == true
# p real_palindrome?('123ab321') == false

# Write a method that returns true if its integer argument is palindromic,
# false otherwise. A palindromic number reads the same forwards and backwards.

def palindromic_number?(num)
  num.to_s.chars == num.to_s.chars.reverse
end

# p palindromic_number?(34543) == true
# p palindromic_number?(123210) == false
# p palindromic_number?(22) == true
# p palindromic_number?(5) == true

puts 500.to_s.chars.reverse
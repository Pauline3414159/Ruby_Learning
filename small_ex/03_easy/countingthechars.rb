# Write a program that will ask a user for an input of a word
# or multiple words and give back the number of characters.
# Spaces should not be counted as a character.

def prompt(string)
  puts "=>#{string}"
end

prompt('Please write word or multiple words:')
user_words = gets.chomp
delete_space_user_words = user_words.delete(" ")
prompt("There are #{delete_space_user_words.size} characters in \" #{user_words}\"")
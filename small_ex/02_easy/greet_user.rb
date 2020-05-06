
=begin
Write a program that will ask for user's name. 
The program will then greet the user. 
If the user writes "name!" then the 
computer yells back to the user.

Examples

What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?
=end

def print_to_user(string)
  puts "=>#{string}"
end

print_to_user('What is your name?')
name = gets.chomp
if name.end_with?('!')
  print_to_user(" HELLO #{name}. WHY ARE WE SCREAMING?")
else
  print_to_user("Hello, #{name}")
end
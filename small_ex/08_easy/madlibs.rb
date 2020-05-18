def promt(msg)
  puts " => #{msg}"
end

def valid_choice?(string)
  if string =~ /[a-zA-Z]/
    true
  else
    false
  end
end

def obtain_word
  word = 'temp'
  loop do
    word = gets.chomp
    break if valid_choice?(word)
    promt('Please enter a word')
  end
  word
end

promt('Welcome to Mad-Libs')
loop do
  promt('Please enter a noun.')
  noun = obtain_word
  promt('Please enter a verb')
  verb = obtain_word
  promt('Please enter an adverb')
  adverb = obtain_word
  promt('Please enter an adjetive')
  adjetive = obtain_word
  sentece_arr =
    ["The #{noun} was happy. Alas, he #{adverb} #{verb} and became #{adjetive}",
    "The #{adjetive} #{noun} #{adverb} #{verb}!"]
  display = sentece_arr.sample
  promt(display.to_s)
  promt(' Would you like to play again? Enter y to continue.')
  ans = gets.chomp.downcase
  break unless ans == 'y'
end

promt('Thanks for playing!')

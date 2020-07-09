file_data = IO.readlines('test_text.txt', chomp: true)
file_data.map! do |line|
  line.split(/\b/)
end

file_data.flatten!
file_data.delete(' ')
arr = []
file_data.each do |word|
  arr << [word, 'type']
end

arr[4][1] = 'noun'
arr[9][1] = 'noun'
arr[14][1] = 'noun'
arr[18][1] = 'noun'
arr[31][1] = 'noun'
arr[25][1] = 'noun'
arr[45][1] = 'noun'
arr[2][1] = 'verb'
arr[6][1] = 'adjetives'
arr[11][1] = 'adjetives'
arr[15][1] = 'adjetives'
arr[21][1] = 'adjetives'
arr[38][1] = 'adjetives'

list_of_nouns =
  %w(earthquake woman spiders scale shape women rake song route baseball boy
     deer tree snail hat horses string addition)
list_of_verbs =
  %w(refused impressed vanished scrubbed suited repaired replaced
     mourned subtracted united chopped irritated)
list_of_adjetives =
  %w(oafish graceful telling cloistered truthful natural
     bewildered encouraging future puffy second quirky)
list_of_adverbs =
  %w(innocently frantically carefully heavily personally
     defiantly bravely adventurously questionably valiantly constantly sedately)

arr.each do |tagged_word|
  if tagged_word[1] == 'noun'
    tagged_word[0] = list_of_nouns.shuffle.pop
  elsif tagged_word[1] == 'verb'
    tagged_word[0] = list_of_verbs.shuffle.pop
  elsif tagged_word[1] == 'adjetives'
    tagged_word[0] = list_of_adjetives.shuffle.pop
  end
end

final_arr = []
arr.each do |tagged_word|
  final_arr << tagged_word[0]
end

p final_arr.join(' ')

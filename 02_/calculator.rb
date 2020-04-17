first_number = nil
second_number = nil
operator = nil

def number?(obj)
  obj = obj.to_s unless obj.is_a? String
  /\A[+-]?\d+(\.[\d]+)?\z/.match(obj)
end

puts 'Welcome to calculator'

loop do
  loop do
    puts 'Enter an integer'
    first_number = gets.chomp
    break if number?(first_number)
    puts 'not a number, try again'
  end
  
  loop do
    puts 'Enter an integer'
    second_number = gets.chomp
    break if number?(second_number)
    puts 'not a number, try again'
  end
  
  puts'Would you like to
    multiply (type M),
    divide (type D),
    subtract (type S),
    or add (type A)?'
  
  loop do
    operator = gets.chomp.upcase
    break if operator.include? 'M'
    break if operator.include? 'D'
    break if operator.include? 'S'
    break if operator.include? 'A'
    puts 'please enter a valid operator'
  end
  
  case operator
  when 'M' then result = first_number.to_i * second_number.to_i
  when 'D' then result = first_number.to_f / second_number.to_f
  when 'S' then result = first_number.to_i - second_number.to_i
  when 'A' then result = first_number.to_i + second_number.to_i
  else          result = 'something went wrong'
  end
  
  puts result

  puts 'Would you like to calculate again? (y to continue)'
  again = gets.chomp.downcase
  break if again != 'y'
end

puts 'thank you for using calculator'

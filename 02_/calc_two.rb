=begin 
    asks for two numbers
    asks for the type of operation to perform: add, subtract, multiply or divide
    displays the result
=end

def prompt (msg)
  puts "=> #{msg}"
end

def number?(obj)
  obj = obj.to_s unless obj.is_a? String
  /\A[+-]?\d+(\.[\d]+)?\z/.match(obj)
end
=begin

    n Place a value n in the "register". Do not modify the stack.
    PUSH Push the register value on to the stack. Leave the value in the register.
    ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
    SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
    MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
    DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
    MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
    POP Remove the topmost item from the stack and place in register
    PRINT Print the register value
=end

def minilang(string_command)
  register = 0
  stack = []
  arr = string_command.split
  arr.each do |co|
    if co.match?(/[0-9]/)
      register = co.to_i
    elsif co.match?("PUSH")
      stack << register
    elsif co.match?("ADD")
      register = register + stack.pop
    elsif co.match?("SUB")
      register = register - stack.pop
    elsif co.match?("MULT")
      register = register * stack.pop
    elsif co.match?("DIV")
      register = (register/stack.pop).to_i
    elsif co.match?("MOD")
      register = (register % stack.pop).to_i
    elsif co.match?("POP")
      register = stack.pop
    elsif co.match?("PRINT")
      puts register
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
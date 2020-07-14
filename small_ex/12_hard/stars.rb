=begin 
Write a method that displays an 8-pointed star in an nxn grid, 
where n is an odd integer that is supplied as an argument to the method. 
The smallest such star you need to handle is a 7x7 grid.

input 'integer'
output 'print 8 pointed star to screen'

7 is the smallest number
input integer will be odd
it's printed in an n by n grid

first line - star on the ends and in the middle
second line - one space between star and end, on in middle
third line - two space
fourth line - full of n stars
5th - third line
6th - second
7th - first

algo
-divide n by 2 and round down-this is the full line for the middle and also the 
  top
-on the first line put the middle star in the center and the other stars on t
  the edge
-next line incriment the space by one until you get to the center line
-then print out the top lines in reverse order
=end

def stars(lol)
  half_way = lol.div(2) 
  counter = half_way
  until counter == 0
  puts ' '*(half_way - counter) + '*'+ ' '*(half_way - (half_way-counter+1))+'*'\
    + ' '*(half_way - (half_way-counter+1)) + '*'
  counter -= 1
  end
  puts '*'*lol
  counter_two = 1
  until counter_two == half_way+1
  puts ' '*(half_way - counter_two) + '*'+ ' '*(half_way - (half_way-counter_two+1))+'*'\
    + ' '*(half_way - (half_way-counter_two+1)) + '*'
  counter_two += 1
  end
end

stars(13)
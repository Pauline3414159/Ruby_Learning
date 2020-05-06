def mult (x, y)
  x * y
end

def square(z)
  mult(z, z)
end

def power(n)
  mult(n**n, 1)
end

p power(4)
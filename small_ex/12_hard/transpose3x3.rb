=begin
transpose a 3x3 matrix
so from

1 5 6 
8 5 4
3 1 2

to
1 8 3
5 5 1
6 4 2

[0][0] = [0][0]
[0][1] = [1][0]
[0][2] = [2][0]

[1][0] = 0 1
1 1     1   1
1 2    2 1

for each element in the first array, put it in the first position
for each element in the second array, put it in the second position
for each element in the third array, put it in the third position
=end

def transpose(matrix)
  arr1 

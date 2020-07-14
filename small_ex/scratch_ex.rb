=begin
Write a method that takes a year as input and returns the century. 
The return value should be a string that begins with the century number, 
and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

Examples:
=end

def what_century(year)
  arr = year.divmod(100)
  #p arr
  cent =  if arr[1] >= 1
            arr[0] + 1
          else
            arr[0]
          end
  # two_digits = cent.to_s.slice(1 ..2).to_i
  # case two_digits
  # when 01       then 'st'
  # when 02       then 'nd'
  # when 03       then 'rd'
  # when 04 .. 99 then 'th'
end



def ordinal_nums(num)
  two_digits = num.to_s.slice(1 ..2).to_i
  case two_digits
  #when  2        then 'nd'
  when 0       then 'th'
  when 1       then 'st'
  when 2       then 'nd'
  when 3       then 'rd'
  when 4 .. 99 then 'th'
  end
end
p ordinal_nums(101)

def century(year)
  (what_century(year)).to_s + ordinal_nums(year)
end

#p century(2000) == '20th'
#p century(2001) == '21st'
#p century(1965) == '20th'
p century(256) #== '3rd'
p century(5) #== '1st'
p century(10103)# == '102nd'
#p century(1052) == '11th'
#p century(1127) == '12th'
#p century(11201) == '113th'
SQ_METER_TO_SQ_FEET = 10.7639
SQ_METER_TO_SQ_INCH = 1550
SQ_METER_TO_SQ_CM = 10_000
SQ_FEET_TO_SQ_METERS = 0.092903
SQ_FEET_TO_SQ_INCH = 144
SQ_FEET_TO_SQ_CM = 929.03

units_flag = nil
length = nil
width = nil
area = nil

def print_to_user(string)
  puts "=>#{string}"
end

def meters_or_feet
  print_to_user("Enter 'm' for meters or 'f' for feet")
  ans = nil
  loop do
    ans = gets.chomp.downcase
    break if ans == 'm' || ans == 'f'
    print_to_user('please enter m or f')
  end
  if ans == 'm'
    'meters'
  else
    'feet'
  end
end

def get_length(uflag)
  print_to_user("Enter the length of the room in #{uflag}:")
  length = gets.to_f.round(2)
  length
end

def get_width(uflag)
  print_to_user("Enter the width of the room in #{uflag}:")
  width = gets.to_f.round(2)
  width
end

def calc_area (length , width)
  area = (length * width).round(2)
  area
end

def display_area_results(areaans,uflag)
  case uflag
  when 'meters'
    print_to_user("The area is #{areaans} square #{uflag}")
    print_to_user("The area is #{(areaans * SQ_METER_TO_SQ_FEET).round(2)} square feet")
    print_to_user("The area is #{(areaans * SQ_METER_TO_SQ_INCH).round(2)} square inches")
    print_to_user("The are is #{(areaans * SQ_METER_TO_SQ_CM).round(2)} square centimeters")
  when 'feet'
    print_to_user("The area is #{areaans} square #{uflag}")
    print_to_user("The area is #{(areaans * SQ_FEET_TO_SQ_METERS).round(2)} square meters")
    print_to_user("The area is #{(areaans * SQ_FEET_TO_SQ_INCH).round(2)} square inches")
    print_to_user("The area is #{(areaans * SQ_FEET_TO_SQ_CM).round(2)} square centimeters")
  end
end

print_to_user('Welcome to room area calcuator')

loop do
  units_flag = meters_or_feet
  length = get_length (units_flag)
  width = get_width (units_flag)
  area = calc_area(length , width)
  display_area_results(area, units_flag)
  print_to_user("Enter 'y' to calculate the room area again")
  ans = gets.chomp.downcase
  break unless ans == 'y'
end

print_to_user('Thank you for using room area calcuator.')

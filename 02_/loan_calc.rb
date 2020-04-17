# list the methods used
def disp_to_user(x)
  puts x
end

def number?(obj)
  obj = obj.to_s unless obj.is_a? String
  /\A[+-]?\d+(\.[\d]+)?\z/.match(obj)
end

def ent_pos_number
  puts 'Enter a postive number.'
end

# initialize the variables so they are visible
monthly_payment = nil
loan_amount = nil
monthly_interest_rate = nil
loan_duration_in_months = nil
annual_percentage_rate = nil
loan_duration_in_years = nil
monthly_intrest_payment = nil
# monthly_payment = loan_amount * (monthly_interest_rate /
# (1 - (1 + monthly_interest_rate)**(-loan_duration_in_months)))
disp_to_user('Welcome to loan calculator.')
loop do
  loop do
    disp_to_user('Enter the total loan amount.')
    loan_amount = gets.chomp
    break if number?(loan_amount) && loan_amount.to_f.arg.zero?
    ent_pos_number
  end
  loan_amount = loan_amount.to_f.ceil(2)
  loop do
    disp_to_user('Enter the annual percentage rate (otherwise known as APR).
Please enter a percentage between 1% to 100%
(APR of ten percent would be entered as 10 )')
    annual_percentage_rate = gets.chomp
    break if number?(annual_percentage_rate)\
      && annual_percentage_rate.to_f >= 1 \
      && annual_percentage_rate.to_f <= 100
    puts 'Enter a postive number between 1 and 100.'
  end
  annual_percentage_rate = annual_percentage_rate.to_f.ceil(2)
  loop do
    disp_to_user('Enter the loan duration in years.')
    loan_duration_in_years = gets.chomp
    break if number?(loan_duration_in_years)\
    && (loan_duration_in_years.to_i * 1 > 0)
    ent_pos_number
  end
  loan_duration_in_years = loan_duration_in_years.to_i
  # calculate the monthly interest rate
  monthly_interest_rate = (annual_percentage_rate / 100) / 12
  # calculate the length of the loan in months
  loan_duration_in_months = loan_duration_in_years * 12
  # calcuate the monthly payment and how much of that is interest,
  # and how much interest you pay
  monthly_payment =
    loan_amount * \
    (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**\
    (-loan_duration_in_months)))
  monthly_intrest_payment = monthly_payment * monthly_interest_rate
  total_interest_payment = monthly_intrest_payment * loan_duration_in_months
  total = total_interest_payment + loan_amount
  disp_to_user("Your monthly payment is #{monthly_payment.to_f.ceil(2)}$.
#{monthly_intrest_payment.to_f.ceil(2)}$ \
  of that payment is interest.")
  disp_to_user("Over the course of the loan, you will pay a \
  total of #{total_interest_payment.to_f.ceil(2)}$.\
You will pay a grand total of #{total.to_f.ceil(2)}$.")
  disp_to_user('Would you like to use loan calculator again? (Y to continue)')
  continue = gets.chomp
  break unless continue.upcase.include?'Y'
end
disp_to_user('Thank you for using loan calculator.')

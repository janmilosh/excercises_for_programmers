class CreditCard

  def initialize
    @type = 'p'
  end

  def calculate_months_until_paid_off i, b, p
    i = i /(100 * 365.0)
    a1 = - 1.0 / 30 
    a2 = Math.log(1.0 + (b * 1.0/p) * (1.0 - (1.0 + i) ** 30))
    a3 = Math.log(1.0 + i)
    return (a1 * a2 / a3).ceil
  end

  def calculate_monthly_payment i, b, m
    i = i/(100 * 365.0)
    p = 30 * b * (i + i/((1.0 + i) ** (m * 30) - 1))
    p = p.round(2)
  end

  def input_balance_and_interest
    print 'What is your balance? '
    b = gets.chomp.to_f
    print 'What is the APR on the card (as a percent)? '
    i = gets.chomp.to_f
    return b, i
  end

  def input_months
    print 'What is the number of months to pay off the card? '
    gets.chomp.to_i
  end

  def input_payment
    print 'What is the monthly payment you can make? '
    gets.chomp.to_f
  end

  def choose_type
    print "\nDo you want to calculate your payment(p), or months to payoff(m)? "
    @type = gets.chomp
    if !['p', 'm'].include? @type
      choose_type
    end
    @type
  end

  def output p, m, i, b
    puts "\nIt will cost $#{ '%.02f' % p }/month for #{ m } months to pay off $#{ '%.02f' % b } at #{ '%.01f' % i }%.\n\n"
  end

  def get_validated_payment_input i, b
    @p = input_payment
    @m = calculate_months_until_paid_off i, b, @p
    return @p, @m
  rescue
    puts 'Your payment isn\'t large enough, please try again.'
    get_validated_payment_input i, b
  end

  def run
    @type = choose_type
    b, i = input_balance_and_interest
    if @type == 'p'
      m = input_months
      p = calculate_monthly_payment i, b, m
    else
      p, m = get_validated_payment_input i, b
    end
    output p, m, i, b
  end
end

cc = CreditCard.new
cc.run

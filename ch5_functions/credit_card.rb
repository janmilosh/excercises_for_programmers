class CreditCard

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

  def prompt text
    print text
    gets.chomp
  end

  def choose_type
    @type = prompt "\nDo you want to calculate your payment(p), or months to payoff(m)? "
    if !['p', 'm'].include? @type
      choose_type
    end
    @type
  end

  def output i, b
    puts "\nIt will cost $#{ '%.02f' % @p }/month for #{ @m } months to pay off $#{ '%.02f' % b } at #{ '%.01f' % i }%.\n\n"
  end

  def get_validated_payment_input i, b
    @p = (prompt 'What is the monthly payment you can make? ').to_f
    @m = calculate_months_until_paid_off i, b, @p
  rescue
    puts 'Your payment isn\'t large enough, please try again.'
    get_validated_payment_input i, b
  end

  def run
    choose_type
    b = (prompt 'What is your balance? ').to_f
    i = (prompt 'What is the APR on the card (as a percent)? ').to_f
    if @type == 'p'
      @m = (prompt 'What is the number of months to pay off the card? ').to_i
      @p = calculate_monthly_payment i, b, @m
    else
      get_validated_payment_input i, b
    end
    output i, b
  end
end

if ENV['TEST'] != 'true'
  cc = CreditCard.new
  cc.run
end

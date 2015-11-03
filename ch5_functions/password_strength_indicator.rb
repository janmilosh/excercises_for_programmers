# A very weak password contains only numbers and is fewer than eight characters. 1
# A weak password contains only letters and is fewer than eight characters. 2
# A strong password contains letters and at least one number and is at least eight characters. 4
# A very strong password contains letters, numbers, and special characters and is at least eight characters. 5

# 8 or more characters +1
# letters +2
# numbers +1
# special characters +1

class PasswordChecker
  def password_validator password
    strength = 0
    strength += 1 if password.length >= 8
    strength += 1 if password =~ /\d/
    strength += 2 if password =~ /[a-zA-Z]+/
    strength += 1 if password =~ /[!@#$%&*]+/
    strength
  end

  def get_input
    puts '*' * 70
    puts
    print 'Enter a password and I\'ll tell you it\'s strength: '
    gets.chomp
  end

  def strength_text strength
    case strength
      when 1
        'very weak'
      when 2, 3
        'weak'
      when 4
        'strong'
      when 5
        'very strong'
    end
  end

  def output password, strength
    print "The password #{ password } is a #{ strength_text strength } password.\n\n"
  end

  def run
    password = get_input
    strength = password_validator password
    output password, strength
  end
end

checker = PasswordChecker.new
checker.run

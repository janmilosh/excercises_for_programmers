class SimpleMath
  attr_accessor :first, :second

  def initialize
  end
    
  def get_numbers
    @first = prompt "\nWhat is the first number? "
    @second = prompt "What is the second number? "
    if !(valid? @first) || !(valid? @second)
      puts "Please input integers greater than zero."
      get_numbers
    end
  end

  def prompt text
    print text
    gets.chomp
  end

  def valid? input
    if (input =~ /^\d+$/) == nil
      return false
    elsif input.to_i <= 0 
      return false
    end
    true  
  end

  def add
    @first + @second
  end

  def subtract
    @first - @second
  end

  def multiply
    @first * @second
  end

  def divide
    (@first.to_f / @second).round
  end

  def output
    @first = @first.to_i
    @second = @second.to_i
    puts "#{ @first } + #{ @second } = #{ add }\n"\
         "#{ @first } - #{ @second } = #{ subtract }\n"\
         "#{ @first } * #{ @second } = #{ multiply }\n"\
         "#{ @first } / #{ @second } = #{ divide }\n\n"
  end

  def run
    get_numbers
    output
  end
end

if __FILE__ == $0
  sm = SimpleMath.new
  sm.run
end

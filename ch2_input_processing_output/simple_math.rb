class SimpleMath  
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

  def output
    @first = @first.to_i
    @second = @second.to_i
    puts "#{ @first } + #{ @second } = #{ @first + @second }\n"\
         "#{ @first } - #{ @second } = #{ @first - @second }\n"\
         "#{ @first } * #{ @second } = #{ @first * @second }\n"\
         "#{ @first } / #{ @second } = #{ (@first.to_f / @second).round }\n\n"
  end

  def run
    get_numbers
    output
  end
end

sm = SimpleMath.new
sm.run

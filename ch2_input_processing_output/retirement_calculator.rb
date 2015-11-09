class RetirementCalculator
  attr_accessor :this_year, :retire_age, :age
  
  def initialize
    @this_year = Time.now.year
  end

  def get_ages
    @age = prompt "\nWhat is your current age? "
    @retire_age = prompt "At what age would you like to retire? "
    if !(valid? @age) || !(valid? @retire_age)
      puts "Please input integers greater than zero."
      get_ages
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

  def calculate
    age_diff = @retire_age.to_i - @age.to_i
    retire_year = @this_year + age_diff
    return age_diff, retire_year
  end

  def output age_diff, retire_year
    if age_diff == 0
      puts "It's #{ @this_year }, you can retire now!\n\n"
    elsif age_diff < 0
      puts "It's #{ @this_year } and you are already retired.\n\n"
    else
      puts "You have #{ age_diff } years until you can retire."
      puts "It's #{ @this_year }, so you can retire in #{ @this_year + age_diff }.\n\n"
    end
  end

  def run
    get_ages
    age_diff, retire_year = calculate
    output age_diff, retire_year
  end
end

retire = RetirementCalculator.new
retire.run

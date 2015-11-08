class CountingCharacters
  def prompt text
    print text
    gets.chomp
  end

  def output str
    if str.size == 0
      puts 'You must enter something!'
      run
    else
      puts "\n#{ str } has #{ str.size } characters.\n\n"
    end
  end

  def run
    output(prompt "\nWhat is the input string? ")
  end
end

c = CountingCharacters.new
c.run

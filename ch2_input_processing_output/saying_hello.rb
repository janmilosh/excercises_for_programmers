class Hello
  def prompt text
    print text
    gets.chomp
  end

  def output name
    puts "\nHello #{ name }, nice to meet you!\n\n"
  end

  def run
    output(prompt "\nWhat is your name? ")
  end
end

if __FILE__ == $0
  hello = Hello.new
  hello.run
end

class Quote
  def prompt text
    print text
    gets.chomp
  end

  def display quote, author
    puts "\n#{ author } says, \"#{ quote }\"\n\n"
  end

  def run
    quote = prompt "\nWhat is the quote? "
    author = prompt "Who said it? "
    display quote, author
  end
end

if __FILE__ == $0
  q = Quote.new
  q.run
end

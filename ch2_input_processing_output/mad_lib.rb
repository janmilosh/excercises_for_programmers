class MadLib
  def prompt text
    print text
    gets.chomp
  end

  def output noun, verb, adj, adv
    puts "Do you #{ verb } your #{ adj } #{ noun } #{ adv }? That's very funny!\n\n"
  end

  def get_inputs
    noun = prompt "\nEnter a noun: "
    verb = prompt "Enter a verb: "
    adjective = prompt "Enter an adjective: "
    adverb = prompt "Enter an adverb: "
    return noun, verb, adjective, adverb
  end
  
  def run
    noun, verb, adjective, adverb = get_inputs
    output noun, verb, adjective, adverb 
  end
end

if ENV['TEST'] != 'true'
  madlib = MadLib.new
  madlib.run
end

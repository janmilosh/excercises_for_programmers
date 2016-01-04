require 'pry'

class NumberGuesser
  attr_reader :message, :level_data
  attr_accessor :level, :number, :guesses

  def initialize
    @another_game = true
    @play_game = true
    @guesses = 0
    @message = "Let's play Guess the Number."
    @level = '1'
    @level_data = { 
        '1' => { 'min' => 1, 'max' =>   10},
        '2' => { 'min' => 1, 'max' =>  100},
        '3' => { 'min' => 1, 'max' => 1000}
      }
  end

  def set_number_to_guess
    num = Random.new
    @number = num.rand(min..max)
  end

  def max
    @level_data[@level]['max']
  end

  def min
    @level_data[@level]['min']
  end

  def guess(input)
    @guesses += 1
    evaluate(input.to_i) if valid_number?(input)
  end

  def valid_level?
    if !level_data.keys.include? @level
      @message = 'Please choose 1, 2, or 3: '
      return false
    end
    true
  end

  def valid_number?(input)
    if !input.match /^\d+$/
      @message = 'Not an integer, guess again: '
      return false
    end
    true
  end

  def comment
    case @guesses
    when 1
      return "You're a mind reader!"
    when 2, 3, 4
      return "Most impressive."
    when 5, 6
      return "You can do better than that."
    else
      return "Better luck next time."
    end
  end
  
  def evaluate(input)
    if input > @number
      @message = 'Too high. Guess again: '
    elsif input < @number
      @message = 'Too low. Guess again: '
    elsif input == @number
      @message = "You got it in #{ @guesses } guesses!\n#{ comment }"
      @play_game = false
    end
  end

  def get_level
    print 'Pick a difficulty level (1, 2, or 3): '
    @level = gets.chomp
    get_level if !valid_level?
  end

  def start_game
    get_level
    set_number_to_guess
    @message = "I have my number. What's your guess (from #{ min } to #{ max })? "
  end

  def set_another_game
    print 'Play again? '
    input = gets.chomp.downcase[0]
    if input == 'y'
      initialize
      @message = "Ok, let's play again then!"
    elsif input == 'n'
      @another_game = false
      puts 'Goodbye!'
    else
      print 'Please input Yes or No: '
      set_another_game
    end
  end

  def run
    while @another_game
      puts @message
      start_game    
      while @play_game
        print @message
        guess(gets.chomp)
      end
      puts @message
      set_another_game
    end
  end
end

if __FILE__ == $0
  game = NumberGuesser.new
  game.run
end

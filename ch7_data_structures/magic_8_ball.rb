class Magic8Ball
  attr_reader :messages

  def initialize
    @messages = ['Yes', 'No', 'Maybe', 'Ask again later']
  end

  def num_messages
    @messages.count
  end
end

class Game
  attr_reader :num_messages, :question_prompt
  def initialize(num_messages)
    @num_messages = num_messages
    @question_prompt = "What's your question? "
  end

  def number
    prng = Random.new
    prng.rand(0...num_messages)
  end
end

class InputOutput
  def prompt text
    print text
    gets.chomp
  end

  def answer text
    puts text
  end
end

if ENV['TEST'] != 'true'
  ball = Magic8Ball.new
  game = Game.new(ball.num_messages)
  random_number = game.number
  io = InputOutput.new
  io.prompt(game.question_prompt)
  io.answer(ball.messages[random_number])
end

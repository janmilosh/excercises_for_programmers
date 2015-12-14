require_relative '../../ch6_repetition/guess_the_numbers'

describe 'NumberGuesser' do
  let(:game) { NumberGuesser.new }
  
  it 'should have the right level choices' do
    expect(game.level_data.keys.sort).to eq ['1', '2', '3']
  end

  it 'should have the correct level 1 max and min' do
    game.level = '1'
    expect(game.min).to eq 1
    expect(game.max).to eq 10
  end

  it 'should have the correct level 2 max and min' do
    game.level = '2'
    expect(game.min).to eq 1
    expect(game.max).to eq 100
  end

  it 'should have the correct level 3 max and min' do
    game.level = '3'
    expect(game.min).to eq 1
    expect(game.max).to eq 1000
  end

  it 'should validate a non-numeric guess' do
    result = game.valid_number?('1abc')
    expect(game.message).to eq "Not an integer, guess again: "
  end

  it 'should validate a non-integer guess' do
    result = game.valid_number?('1.1')
    expect(game.message).to eq "Not an integer, guess again: "
  end

  it 'should count a non-numeric guess as a guess' do
    expect(game.guesses).to eq 0
    game.guess('abc')
    expect(game.guesses).to eq 1 
  end

  it 'should validate a wrong numeric level entry' do
    game.level = '5'
    result = game.valid_level?
    expect(result).to eq false
    expect(game.message).to eq 'Please choose 1, 2, or 3: '
  end

  it 'should validate a wrong non-numeric level entry' do
    game.level = '1khf'
    result = game.valid_level?
    expect(result).to eq false
    expect(game.message).to eq 'Please choose 1, 2, or 3: '
  end

  it 'should have an ititial level' do
    expect(game.level).to eq '1'
  end

  it 'should set the level' do
    game.level = '2'
    expect(game.level).to eq '2'
  end

  it 'should set a level 1 number' do
    game.level = '1'
    result = game.set_number_to_guess
    expect(result).to be >= game.min
    expect(result).to be <= game.max
  end

  it 'should set a level 2 number' do
    game.level = '2'
    result = game.set_number_to_guess
    expect(result).to be >= game.min
    expect(result).to be <= game.max
  end

  it 'should set a level 3 number' do
    game.level = '3'
    result = game.set_number_to_guess
    expect(result).to be >= game.min
    expect(result).to be <= game.max
  end

  it 'should evaluate a valid high guess' do
    game.number = 3
    result = game.evaluate(6)
    expect(game.message).to eq 'Too high. Guess again: '
  end

  it 'should evaluate a valid low guess' do
    game.number = 6
    result = game.evaluate(3)
    expect(game.message).to eq 'Too low. Guess again: '
  end

  it 'should evaluate a correct guess' do
    game.number = 20
    game.guess('5')
    game.guess('8')
    game.guess('20')
    expect(game.message).to eq 'You got it in 3 guesses!
Most impressive.'
  end

  it 'should return the correct comment for 1 guess' do
    game.guesses = 1
    expect(game.comment).to eq "You're a mind reader!"
  end

  it 'should return the correct comment for 3 guesses' do
    game.guesses = 3
    expect(game.comment).to eq "Most impressive."
  end

  it 'should return the correct comment for 5 guesses' do
    game.guesses = 5
    expect(game.comment).to eq "You can do better than that."
  end

  it 'should return the correct comment for 7 guesses' do
    game.guesses = 7
    expect(game.comment).to eq "Better luck next time."
  end
end

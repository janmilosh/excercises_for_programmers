require_relative '../../ch7_data_structures/magic_8_ball'

describe 'Magic 8 Ball Game' do
  let(:ball) { Magic8Ball.new }
  let(:messages) { ['Ask again later', 'Maybe', 'No', 'Yes'] }
  let(:game) { Game.new(ball.num_messages) }
  
  context 'Magic8Ball' do
    it 'should have an array of messages' do
      expect(ball.messages.sort).to eq messages
    end

    it 'should return a message in messages' do
      ball.messages.each_with_index do |val, index|
        expect(messages).to include ball.messages[index]
      end
    end

    it 'should return the number of messages available' do
      expect(ball.num_messages).to eq messages.count
    end
  end

  context 'Game' do
    it 'should generate a random integer in the correct range' do
      expect((0...ball.num_messages).to_a).to include game.number
    end
  end
end

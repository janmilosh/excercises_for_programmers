require 'spec_helper'
require_relative '../ch2_input_processing_output/simple_math'

describe 'SimpleMath' do
  let(:simple_math) { SimpleMath.new }

  it 'should handle a valid input' do
    result = simple_math.valid? '175'
    expect(result).to eq true
  end

  it 'should handle an invalid input with letters' do
    result = simple_math.valid? '19p8'
    expect(result).to eq false
  end

  it 'should handle a negative invalid input' do
    result = simple_math.valid? '-2'
    expect(result).to eq false
  end

  it 'should handle a zero invalid input' do
    result = simple_math.valid? '0'
    expect(result).to eq false
  end
end
require 'spec_helper'
require_relative '../ch2_input_processing_output/simple_math'

describe 'SimpleMath' do
  let(:simple_math) { SimpleMath.new }

  before do
    simple_math.first = 20
    simple_math.second = 30
  end

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

  it 'should add' do
    expect(simple_math.add).to eq 50
  end

  it 'should subtract' do
    expect(simple_math.subtract).to eq -10
  end

  it 'should multiply' do
    expect(simple_math.multiply).to eq 600
  end

  it 'should divide' do
    expect(simple_math.divide).to eq 1
  end
end
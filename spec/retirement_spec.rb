require 'spec_helper'
require_relative '../ch2_input_processing_output/retirement_calculator'

describe 'RetirementCalculator' do
  let(:retirement) { RetirementCalculator.new }

  it 'should calculate the retirement year' do
    retirement.this_year = 2014
    retirement.age = '50'
    retirement.retire_age = '66'
    age_diff, retire_year = retirement.calculate 
    expect(age_diff).to eq 16
    expect(retire_year).to eq 2030
  end
end
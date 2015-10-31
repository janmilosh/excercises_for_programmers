require 'spec_helper'
require_relative '../ch5_functions/password_strength_indicator'

describe 'PasswordChecker' do
  let(:checker) { PasswordChecker.new } 
  
  it 'should evaluate a short all number password' do
    check = checker.password_validator '9012987'
    expect(check).to eq 1
  end

  it 'should evaluate a short all letter password' do
    check = checker.password_validator 'aiPJehk'
    expect(check).to eq 2
  end

  it 'should evaluate a short letter and number password' do
    check1 = checker.password_validator 'ailoeh2'
    check2 = checker.password_validator '28375m0'
    expect(check1).to eq 3
    expect(check2).to eq 3
  end

  it 'should evaluate a long enough all letter password' do
    check = checker.password_validator 'ailoehtp'
    expect(check).to eq 3
  end

  it 'should evaluate a long enough all number password' do
    check = checker.password_validator '68594837'
    expect(check).to eq 2
  end

  it 'should evaluate a long enough letter and number password' do
    check1 = checker.password_validator 'ailo5eh2'
    check2 = checker.password_validator '673940U2'
    expect(check1).to eq 4
    expect(check2).to eq 4
  end

  it 'should evaluate a long enough letter, number, and special char. pwd' do
    check1 = checker.password_validator 'ai$o!eh2'
    check2 = checker.password_validator '&#$%$o!234HIekengh2'
    expect(check1).to eq 5
    expect(check2).to eq 5
  end
end

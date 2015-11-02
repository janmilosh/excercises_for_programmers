require 'spec_helper'
require_relative '../ch5_functions/credit_card'

describe 'CreditCard' do
  let(:credit_card) { CreditCard.new }
  
  it 'should calculate the months' do
    months = credit_card.calculate_months_until_paid_off 12, 5000, 100
    expect(months).to eq 70
  end

  it 'should calculate the payment' do
    payment = credit_card.calculate_monthly_payment 12, 5000, 70
    expect(payment).to eq 98.91
  end 
end
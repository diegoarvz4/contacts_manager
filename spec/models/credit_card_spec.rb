require 'rails_helper'

describe CreditCard do

  before do 
    @user = FactoryBot.build(:user)
    @contact = FactoryBot.build(:contact)
  end

  it "is a valid credit card object" do
    credit_card = FactoryBot.build(:credit_card, contact: @contact)
    expect(credit_card).to be_valid
  end

  it "is invalid without a number" do
    credit_card = FactoryBot.build(:credit_card, number: nil, contact: @contact)
    credit_card.valid?
    expect(credit_card.errors[:number]).to include("can't be blank")
  end

  it "is invalid without a contact" do
    credit_card = FactoryBot.build(:credit_card, contact: nil)
    expect(credit_card).to_not be_valid
  end

  it "is invalid with a short number" do
    credit_card = FactoryBot.build(:credit_card, number: '123', contact: @contact)
    expect(credit_card).to_not be_valid
  end

end
require 'rails_helper'

describe Contact do

  before do 
    @user = FactoryBot.build(:user)
  end

  it "is invalid without a name" do
    contact = FactoryBot.build(:contact, name: nil, user: @user)
    contact.valid?
    expect(contact.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a phone" do
    contact = FactoryBot.build(:contact, phone: nil, user: @user)
    contact.valid?
    expect(contact.errors[:phone]).to include("can't be blank")
  end

  it "is invalid without a birthdate" do
    contact = FactoryBot.build(:contact, birthdate: nil, user: @user)
    contact.valid?
    expect(contact.errors[:birthdate]).to include("can't be blank")
  end

  it "is invalid without an address" do
    contact = FactoryBot.build(:contact, address: nil, user: @user)
    contact.valid?
    expect(contact.errors[:address]).to include("can't be blank")
  end


end
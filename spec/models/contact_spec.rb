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

  it "is valid with a proper phone format" do
    phone_1 = '(+00) 000 000 00 00'
    phone_2 = '(+57) 320 432 05 09'
    phone_3 = '(+00) 000-000-00-00'
    phone_4 = '(+57) 320-432-05-09'
    contact = FactoryBot.build(:contact, phone: phone_1, user: @user)
    expect(contact).to be_valid


    contact = FactoryBot.build(:contact, phone: phone_2, user: @user)
    expect(contact).to be_valid


    contact = FactoryBot.build(:contact, phone: phone_3, user: @user)
    expect(contact).to be_valid


    contact = FactoryBot.build(:contact, phone: phone_4, user: @user)
    expect(contact).to be_valid
  end

  it "is invalid without a proper phone format" do
    phone_1 = '(+00)000 000 00 00'
    phone_2 = '(+57) 320432 05 09'
    phone_3 = '(+005) 000-000-00-00'
    phone_4 = '(+57 320-432-05-09'
    contact = FactoryBot.build(:contact, phone: phone_1, user: @user)
    expect(contact).to_not be_valid


    contact = FactoryBot.build(:contact, phone: phone_2, user: @user)
    expect(contact).to_not be_valid


    contact = FactoryBot.build(:contact, phone: phone_3, user: @user)
    expect(contact).to_not be_valid


    contact = FactoryBot.build(:contact, phone: phone_4, user: @user)
    expect(contact).to_not be_valid
  end

  it "is invalid with special characters in name" do
    name_1 = 'master!%h'
    name_2= 'Fer78#'
    name_3 = '!Amigo%$'
    name_4 = 'J?anj¡¡'
    contact = FactoryBot.build(:contact, name: name_1, user: @user)
    expect(contact).to_not be_valid


    contact = FactoryBot.build(:contact, name: name_2, user: @user)
    expect(contact).to_not be_valid


    contact = FactoryBot.build(:contact, name: name_3, user: @user)
    expect(contact).to_not be_valid


    contact = FactoryBot.build(:contact, name: name_4, user: @user)
    expect(contact).to_not be_valid
  end

  it "is valid without special characters in name" do
    name_1 = 'master h'
    name_2= 'Fe-r78'
    name_3 = 'Amigo-'
    name_4 = 'Janj-solo4'
    contact = FactoryBot.build(:contact, name: name_1, user: @user)
    expect(contact).to be_valid


    contact = FactoryBot.build(:contact, name: name_2, user: @user)
    expect(contact).to be_valid


    contact = FactoryBot.build(:contact, name: name_3, user: @user)
    expect(contact).to be_valid


    contact = FactoryBot.build(:contact, name: name_4, user: @user)
    expect(contact).to be_valid
  end


end
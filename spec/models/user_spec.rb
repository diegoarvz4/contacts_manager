require 'rails_helper'

describe User do
  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is invalid without a username" do
    user = FactoryBot.build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    user = FactoryBot.create(:user)
    new_user = FactoryBot.build(:user, email: user.email)
    new_user.valid?
    expect(new_user.errors[:email]).to include("has already been taken")
  end

  it "is invalid with a duplicate username" do
    user = FactoryBot.create(:user)
    new_user = FactoryBot.build(:user, username: user.username)
    new_user.valid?
    expect(new_user.errors[:username]).to include("has already been taken")
  end


end
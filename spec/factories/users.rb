FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "User#{n}" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password '123456'
  end
end

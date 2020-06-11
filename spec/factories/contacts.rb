FactoryBot.define do
  factory :contact do
    association :user
    sequence(:name) { |n| "Contact#{n}" }
    sequence(:phone) { |n| "(+72) 000 000 00 0#{n%9}" }
    birthdate '2018-10-02'
    address 'some random address'
    sequence(:email) { |n| "test#{n}@mail.com" }

    
  end
end

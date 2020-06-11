FactoryBot.define do
  factory :contact do
    association :user
    sequence(:name) { |n| "Contact#{n}" }
    sequence(:phone) { |n| "(+72)+00) 000 000 00 0#{n}" }
    birthdate '2018-10-02'
    address 'some random address'
    
  end
end

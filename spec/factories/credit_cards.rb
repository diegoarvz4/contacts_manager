FactoryBot.define do
  factory :credit_card do
      number 1234567812345678
      association :contact
  end
end

class CreditCard < ApplicationRecord
  belongs_to :contact

  validates :number, presence: true, length: {minimum: 12, maximum: 19}
  validates :franchise, presence: true
  validate :checkLuhn

  before_validation do
    self.franchise = CreditCardFranchise.call(self.number)
  end

  before_save do
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST
    : BCrypt::Engine.cost
    self.last_four_digits = self.number[-4..-1]
    self.number = BCrypt::Password.create(self.number, cost: cost)
  end

  def checkLuhn
    number = self.number.to_s
    sum = number[number.length - 1].to_i
    nDigits = number.length
    parity = nDigits % 2
    for i in 0..nDigits - 2 do
        digit = number[i].to_i
        if i % 2 == parity
            digit = digit * 2
        end
        if digit > 9
            digit = digit - 9 
        end
        sum = sum + digit
    end
    sum % 10 == 0
  end

end

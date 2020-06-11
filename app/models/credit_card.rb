class CreditCard < ApplicationRecord
  belongs_to :contact

  validates :number, presence: true
  validates :franchise, presence: true
  validate :checkLuhn

  before_validation do
    self.franchise = CreditCardFranchise.call(self.number)
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

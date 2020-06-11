class CreditCardFranchise

  include CreditCards

  def self.call(credit_card_number)
    new(credit_card_number).call
  end

  def initialize(credit_card_number)
    @credit_card_number = credit_card_number
  end

  def call
    get_franchise(@credit_card_number)
  end


end
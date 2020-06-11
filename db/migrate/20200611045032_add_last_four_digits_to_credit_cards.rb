class AddLastFourDigitsToCreditCards < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_cards, :last_four_digits, :string
  end
end

class ChangeNumberInCreditCards < ActiveRecord::Migration[5.2]
  def change
    change_column :credit_cards, :number, :string
  end
end

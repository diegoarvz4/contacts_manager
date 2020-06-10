class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :number
      t.string :franchise
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end

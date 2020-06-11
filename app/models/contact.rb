require "csv";

class Contact < ApplicationRecord
  belongs_to :user
  has_one :credit_card, dependent: :delete

  validates :name, presence: true
  validates :phone, presence: true
  validates :birthdate, presence: true
  validates :address, presence: true

end

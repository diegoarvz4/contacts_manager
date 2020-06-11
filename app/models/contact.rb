class Contact < ApplicationRecord
  belongs_to :user
  has_one :credit_card, dependent: :delete

  validates :name, presence: true, uniqueness: { scope: :user_id }, format: { with: /\A[a-zA-Z0-9\-\s]*\z/}
  validates :phone, presence: true, format: { 
    with: /\A\(\+\d{2}\)\s\d{3}[\s\-]\d{3}[\s\-]\d{2}[\s\-]\d{2}\z/
  }
  validates :birthdate, presence: true
  validates :address, presence: true
  validates :email, presence: true, uniqueness: { scope: :user_id }, length: { maximum: 255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

end

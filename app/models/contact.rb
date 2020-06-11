class Contact < ApplicationRecord
  belongs_to :user
  has_one :credit_card, dependent: :delete

  validates :name, presence: true, uniqueness: { scope: :user_id }, format: { with: /\A[a-zA-Z0-9\-\s]*\z/}
  validates :phone, presence: true, format: { 
    with: /\A\(\+\d{2}\)\s\d{3}[\s\-]\d{3}[\s\-]\d{2}[\s\-]\d{2}\z/
  }
  validates :birthdate, 
    presence: true, 
    format: {
      with: /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))|([12]\d{3}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01]))/,
      message: 'El formato debe ser "año-mes-día" o "AñoMesDía"'
    }


  validates :address, presence: true
  validates :email, presence: true, uniqueness: { scope: :user_id }, length: { maximum: 255 }


end

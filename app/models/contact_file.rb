class ContactFile < ApplicationRecord
  belongs_to :user
  has_many :file_errors
end

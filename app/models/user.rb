class User < ApplicationRecord
  has_many :orders
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :phone_number, lenght:{ is: 9..12, wrong_lenght: "phone number must have between 9 and 12 numbers"}
  validates :password, lenght:{ is: 8..12, wrong_lenght: "Password must have between 8 and 12 characters"}
end

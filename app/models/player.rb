class Player < ApplicationRecord

  validates :first_name, presence: true
  validates :surname, presence: true
  email_validator = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: email_validator }
  validates :team, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 2
  }

end

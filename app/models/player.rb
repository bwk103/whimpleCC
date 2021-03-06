class Player < ApplicationRecord
  has_one :batting
  has_one :bowling
  has_one :fielding
  validates :first_name, presence: true
  validates :surname, presence: true
  email_validator = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: email_validator }
  validates :team, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 2
  }
  permitted_roles = ['Batsman', 'Bowler', 'All-Rounder', 'Wicketkeeper']
  validates :role, presence: true, inclusion: { in: permitted_roles }
end

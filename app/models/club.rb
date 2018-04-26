class Club < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :ground, presence: true, length: { minimum: 10 }
end

class Event < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :description, presence: true
end

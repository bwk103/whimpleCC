class Fixture < ApplicationRecord

    validates :opponent, presence: true
    validates :location, presence: true
    validates :date, presence: true
    validates :time, presence: true
end

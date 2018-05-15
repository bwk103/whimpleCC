class Fixture < ApplicationRecord

    validates :opponent, presence: true
    validates :location, presence: true
    validates :match_start, presence: true
end

class Batting < ApplicationRecord
  validates :games, numericality: { greater_than_or_equal_to: 0 }
  validates :innings, numericality: {
                        greater_than_or_equal_to: 0,
                        less_than_or_equal_to: proc { |stat| stat.games * 2 }
                      }
end

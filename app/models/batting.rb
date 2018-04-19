class Batting < ApplicationRecord
  attr_accessor :average

  validates :games, numericality: { greater_than_or_equal_to: 0 }
  validates :innings, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: proc { |stat| stat.games * 2 }
  }
  validates :not_outs, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: proc { |stat| stat.games * 2 }
  }
  validates :runs, numericality: { greater_than_or_equal_to: 0 }
  validates :high_score, numericality: { greater_than_or_equal_to: 0,
                                         less_than_or_equal_to: :runs }
  validates :average, numericality: { greater_than_or_equal_to: 0 }
  validates :fifties, numericality: { greater_than_or_equal_to: 0 }
  validates :hundreds, numericality: { greater_than_or_equal_to: 0 }

  def set_average
    return self.average = nil if self.innings == self.not_outs
    self.average = runs / (innings - not_outs)
  end
end

class Bowling < ApplicationRecord
  attr_accessor :economy, :strike_rate
  validates :overs, numericality: { greater_than_or_equal_to: 0 }
  validates :maidens, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: :overs }
  validates :runs, numericality: { greater_than_or_equal_to: 0 }
  validates :wickets, numericality: { greater_than_or_equal_to: 0 }
  validates :five_for, numericality: { greater_than_or_equal_to: 0 }

  def set_economy
    self.economy = runs / overs
  end

  def set_strike_rate
    balls_bowled = overs * 6
    self.strike_rate = (balls_bowled / wickets).round(1)
  end

  def set_average
    self.average = (runs / wickets.to_f).round(1)
  end

end

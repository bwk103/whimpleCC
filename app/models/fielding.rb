class Fielding < ApplicationRecord
  belongs_to :player
  validates :catches, numericality: { greater_than_or_equal_to: 0 }
  validates :stumpings, numericality: { greater_than_or_equal_to: 0 }
  validates :run_outs, numericality: { greater_than_or_equal_to: 0 }
end

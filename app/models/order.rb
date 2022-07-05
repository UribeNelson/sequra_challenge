class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper

  scope :completed, -> { where.not(completed_at: nil) }
end

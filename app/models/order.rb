class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper

  scope :completed, -> { where.not(completed_at: nil) }

  before_save :calculate_fee

  private

  def calculate_fee
    self.fee = self.amount * 0.01 if self.amount <= 50
    self.fee = self.amount * 0.95 if 50 < self.amount && self.amount <= 300
    self.fee = self.amount * 0.85 if 300 < self.amount
  end
end

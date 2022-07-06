class DisbursementsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    start_date = 7.days.ago
    completed_orders = Order.completed.where('? <= completed_at', start_date)
    fee_by_merchant = completed_orders.group(:merchant).sum(:fee)
    fee_by_merchant.keys.each do |key|
      Disbursement.create merchant_id: key, amount: fee_by_merchant[key], start_date: start_date
    end
  end
end

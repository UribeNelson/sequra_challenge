require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "completed orders" do
    orders = Order.completed
    assert_equal  1, orders.count, 'Only one order is completed.'
  end

  test "50 amount or less calculate fee 1%" do
    order = Order.new merchant: merchants(:one), shopper: shoppers(:one), amount: 50
    order.save
    assert_in_delta 0.5, order.fee, 0.00001, 'Fee was not 1%'
  end

  test "amount over 50 to 300 calculate fee 0.95%" do
    order = Order.new merchant: merchants(:one), shopper: shoppers(:one), amount: 51
    order.save
    assert_in_delta 51*0.95, order.fee, 0.00001, 'Fee was not 0.95%'
    order = Order.new merchant: merchants(:one), shopper: shoppers(:one), amount: 300
    order.save
    assert_equal 300*0.95, order.fee, 'Fee was not 0.95%'
  end

  test "amount over 300 calculate fee 85%" do
    order = Order.new merchant: merchants(:one), shopper: shoppers(:one), amount: 300.2
    order.save
    assert_equal 300.2*0.85, order.fee, 'Fee was not 85%'
  end
end

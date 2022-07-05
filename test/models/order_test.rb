require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "completed orders" do
    orders = Order.completed
    assert_equal orders.count, 1, 'Only one order is completed.'
  end
end

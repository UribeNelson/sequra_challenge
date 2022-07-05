class AddFeeToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :fee, :decimal, default: 0
  end
end

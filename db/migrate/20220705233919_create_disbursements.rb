class CreateDisbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :disbursements do |t|
      t.references :merchant, null: false, foreign_key: true
      t.datetime :start_date
      t.decimal :amount

      t.timestamps
    end
  end
end

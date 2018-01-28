class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :tracking_number
      t.integer :order_number
      t.string :address

      t.timestamps
    end
  end
end

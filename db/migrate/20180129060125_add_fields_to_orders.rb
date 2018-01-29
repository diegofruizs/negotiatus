class AddFieldsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :time_min, :integer
    add_column :orders, :message, :string
  end
end

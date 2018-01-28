class ReferenceToVendor < ActiveRecord::Migration[5.0]
  def change
  	add_reference :orders, :vendor, index: true
  	add_foreign_key :orders, :vendors
  end
end

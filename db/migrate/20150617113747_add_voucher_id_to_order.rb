class AddVoucherIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :voucher_id, :integer
  end
end

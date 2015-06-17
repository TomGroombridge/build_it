class AddPriceOfActivationToVoucher < ActiveRecord::Migration
  def change
    add_column :vouchers, :price_of_activation, :decimal
  end
end

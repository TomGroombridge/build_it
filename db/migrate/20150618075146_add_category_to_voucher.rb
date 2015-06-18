class AddCategoryToVoucher < ActiveRecord::Migration
  def change
    add_column :vouchers, :category, :string
  end
end

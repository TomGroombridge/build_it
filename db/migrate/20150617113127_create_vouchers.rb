class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.decimal :price

      t.timestamps
    end
  end
end

class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :product_id
      t.decimal :product_price
      t.integer :quantity
      t.integer :total_price
      t.integer :order_id

      t.timestamps
    end
  end
end

class RemoveCatergory < ActiveRecord::Migration
  def change
  	remove_column :products, :catergory, :string
  	add_column :products, :category, :string
  end
end

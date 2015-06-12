class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def create
		@product = Product.create(params[:product].permit(:name, :category, :price, :stock))
    if @product.save
      redirect_to '/products'
    else
      render new_post_path
    end
	end

	def index
		@products = Product.all
		@order_item = current_order.order_items.new
	end

end

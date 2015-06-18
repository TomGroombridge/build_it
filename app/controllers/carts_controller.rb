	class CartsController < ApplicationController

	def show
		@order_items = current_order.order_items
		@order = current_order
		vouchers = Voucher.all
		@vouchers = []
		vouchers.each do |v|
			@order_items.each do |item|
				if v.category == nil && v.price_of_activation <= @order.subtotal
					@vouchers	<< v
				elsif item.product.category.include?("footwear") && (v.price_of_activation <= @order.subtotal)
					@vouchers	<< v
				end
			end
		end
		@vouchers = @vouchers.uniq
	end

end

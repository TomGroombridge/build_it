class CartsController < ApplicationController

	def show
		@order_items = current_order.order_items
		@order = current_order
		vouchers = Voucher.all
		@vouchers = []
		vouchers.map  do |v|
			if v.price_of_activation <= @order.subtotal
				@vouchers << v
			end
		end
	end

end

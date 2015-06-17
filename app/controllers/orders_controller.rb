class OrdersController < ApplicationController

	def update
		@order = current_order
		@order.update_attributes(order_params)
		@order_items = @order.order_items
		vouchers = Voucher.all
		@vouchers = []
		vouchers.map  do |v|
			if v.price_of_activation <= @order.subtotal
				@vouchers << v
			end
		end
	end

	private

	def order_params
		params.require(:order).permit(:voucher_id)
	end



end

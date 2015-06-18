class OrdersController < ApplicationController

	def update
		@order = current_order
		@order.update_attributes(order_params)
		@order_items = @order.order_items
		vouchers = Voucher.all
		@vouchers = []
		vouchers.each do |v|
			@order_items.each do |item|
				if item.product.category == v.category && v.price_of_activation <= @order.subtotal
					@vouchers	<< v
				elsif v.category.nil? && v.price_of_activation <= @order.subtotal
					@vouchers	<< v
				end
			end
		end
		@vouchers = @vouchers.uniq
	end

	private

	def order_params
		params.require(:order).permit(:voucher_id)
	end



end

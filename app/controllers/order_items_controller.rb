class OrderItemsController < ApplicationController

	def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
    # @stock = @order_item.product.stock
    # @order_item.product.update_attributes(:stock => @stock - 1)
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    vouchers = Voucher.all
    @vouchers = []
    vouchers.map  do |v|
      if v.price_of_activation <= @order.total
        @vouchers << v
      end
    end

  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
    # @stock = @order_item.product.stock
    # @order_item.product.update_attributes(:stock => @stock + 1)
  end


	private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

end

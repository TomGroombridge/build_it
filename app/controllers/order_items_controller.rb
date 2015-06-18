class OrderItemsController < ApplicationController

	def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    @product = @order_item.product
    @product.update_attributes(stock: (@product.stock - 1))
    @products = Product.all
    session[:order_id] = @order.id
    respond_to do |format|
      format.html {
         render :action => "create"
      }
      format.js {}
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
    vouchers = Voucher.all
    @vouchers = []
    vouchers.each do |v|
      @order_items.each do |item|
        if v.category == nil && v.price_of_activation <= @order.subtotal
          @vouchers << v
        elsif item.product.category.include?("footwear") && (v.price_of_activation <= @order.subtotal)
          @vouchers << v
        end
      end
    end
    @vouchers = @vouchers.uniq
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @product = @order_item.product
    @quantity = @order_item.quantity
    @product.update_attributes(:stock => (@product.stock + @quantity))
    @order_item.destroy
    @order_items = @order.order_items
    vouchers = Voucher.all
    @vouchers = []
    vouchers.each do |v|
      @order_items.each do |item|
        if v.category == nil && v.price_of_activation <= @order.subtotal
          @vouchers << v
        elsif item.product.category.include?("footwear") && (v.price_of_activation <= @order.subtotal)
          @vouchers << v
        end
      end
    end
    @vouchers = @vouchers.uniq

  end


	private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

end

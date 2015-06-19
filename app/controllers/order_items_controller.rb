class OrderItemsController < ApplicationController
  before_action :find_order_item, :except => [:create]

	def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    @product = @order_item.product
    @product.update_attributes(stock: (@product.stock - 1))
    session[:order_id] = @order.id
    @products = Product.all
    respond_to do |format|
      format.js
    end
  end

  def update
    @order_item.update_attributes(order_item_params)
    @order_item.product.update_attributes(stock: (@order_item.product.stock - @order_item.quantity))
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
    @order_item.product.update_attributes(:stock => (@order_item.product.stock + @order_item.quantity))
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

  def find_order_item
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
  end

end

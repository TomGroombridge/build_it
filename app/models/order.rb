class Order < ActiveRecord::Base
	has_many :order_items
	belongs_to :voucher
	before_save :update_subtotal

  def subtotal
    total = order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def total
  	total = order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
    if self.voucher.nil?
    	total
    elsif self.subtotal >= self.voucher.price_of_activation
	    total - self.voucher.price
		else
			self.update_attributes(voucher_id: nil)
			total
		end
  end

  def total_items
  	quantity = self.order_items.map{|item| item.quantity}
  	quantity.inject{|sum,x| sum + x }
  end

private

  def update_subtotal
    self[:subtotal] = subtotal
  end

end

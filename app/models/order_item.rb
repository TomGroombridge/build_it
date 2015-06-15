class OrderItem < ActiveRecord::Base
	belongs_to :product
  belongs_to :order
  before_save :double_check

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

private

  def double_check
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end

end

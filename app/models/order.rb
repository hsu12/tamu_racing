class Order < ActiveRecord::Base
  has_many :order_items
  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

private

  def update_subtotal
    self[:subtotal] = subtotal
    self[:shipping] = 10
    self[:tax] = subtotal * 0.0825
    self[:total] = subtotal + self[:shipping] + self[:tax]
  end
  
end
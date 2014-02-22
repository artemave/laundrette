class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :service

  monetize :price_pennies

  after_save :update_order_total
  after_destroy :update_order_total

  def name
    service.name
  end

  def subtotal
    price * quantity
  end

  protected

  def update_order_total
    order.total = order.items.map(&:subtotal).reduce(:+)
    order.save!
  end
end

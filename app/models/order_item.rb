class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :service

  monetize :price_pennies

  def name
    service.name
  end

  def subtotal
    price * quantity
  end
end

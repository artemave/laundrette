class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item_type

  monetize :price_pennies

  def name
    item_type.name
  end

  def subtotal
    price * quantity
  end
end

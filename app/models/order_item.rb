class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item_type
  belongs_to :color

  monetize :price_pennies

  def name
    item_type.name
  end
end

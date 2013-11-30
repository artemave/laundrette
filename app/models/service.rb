class Service < ActiveRecord::Base
  monetize :default_price_per_item_pennies

  has_many :order_items

  before_destroy :check_has_no_order_items

  private

  def check_has_no_order_items
    if order_items.count > 0
      errors.add(:base, "Can't remove this service because it has orders associated with it.")
      false
    end
  end
end

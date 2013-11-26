class Service < ActiveRecord::Base
  monetize :default_price_per_item_pennies
end

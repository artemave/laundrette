class OrderWithItems
  include Virtus.model
  include ActiveModel::Model

  attribute :customer, Customer
  attribute :order, Order, default: lambda {|o, attr| o.customer.orders.new }

  attribute :due_date, DateTime, default: lambda{|o, attr| o.order.due_date }
  attribute :sticker_number, String, default: lambda{|o, attr| o.order.sticker_number }
  attribute :status, String, default: lambda{|o, attr| o.order.status }
  attribute :order_items, Array[OrderItem], default: lambda{|o, attr| o.order.items }
end

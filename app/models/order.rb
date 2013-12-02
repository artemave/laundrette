class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :items, class_name: 'OrderItem'

  accepts_nested_attributes_for :items, allow_destroy: true

  def total
    items.map(&:subtotal).reduce(:+)
  end

  def complete!
    
  end

  def status
    read_attribute(:status).presence || 'New'
  end
end

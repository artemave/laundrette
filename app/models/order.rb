class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :items, class_name: 'OrderItem'

  accepts_nested_attributes_for :items, allow_destroy: true

  STATUSES = %w(New Complete Cancelled)

  validates :status, inclusion: { in: STATUSES }

  def total
    items.map(&:subtotal).reduce(:+)
  end

  def status
    read_attribute(:status).presence || 'New'
  end
end

class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :items, class_name: 'OrderItem', dependent: :destroy

  accepts_nested_attributes_for :items, allow_destroy: true

  STATUSES = %w(New Complete Cancelled)

  validates :status, inclusion: { in: STATUSES }
  validates :sticker_number, uniqueness: true, presence: true

  default_value_for :sticker_number do
    if last_order = Order.last and last_order != self
      new_number = last_order.sticker_number.gsub(/\d+/) { |num| num.to_i.next }
      new_number.presence || 'NS0'
    else
      'NS0'
    end
  end

  default_value_for :status, 'New'

  def total
    items.map(&:subtotal).reduce(:+)
  end
end

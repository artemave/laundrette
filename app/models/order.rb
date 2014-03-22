class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :items, class_name: 'OrderItem', dependent: :destroy

  monetize :total_pennies

  accepts_nested_attributes_for :items, allow_destroy: true

  STATUSES = %w(New Complete Cancelled)

  validates :status, inclusion: { in: STATUSES }
  validates :sticker_number, uniqueness: true, presence: true

  scope :in_progress, -> { where(status: 'New') }
  scope :due_soon_or_overdue, -> { in_progress.where("due_date < ?", Date.today + 2.day) }

  default_value_for :sticker_number do
    if last_order = Order.last and last_order != self
      new_number = last_order.sticker_number.gsub(/\d+/) { |num| num.to_i.next }
      new_number.presence || 'NS0'
    else
      'NS0'
    end
  end

  def complete?
    status == 'Complete'
  end

  def complete!
    update_attribute :status, 'Complete'
  end

  def toggle_status
    new_status = status == 'New' ? 'Complete' : 'New'
    update_attribute :status, new_status
  end

  def toggle_paid
    update_attribute :paid, !paid
  end

  default_value_for :status, 'New'
  default_value_for :total, 0.to_money
end

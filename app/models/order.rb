class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :items, class_name: 'OrderItem'

  def total
    
  end

  def complete!
    
  end
end

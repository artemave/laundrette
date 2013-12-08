class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.notify_about_orders_that_due_soon_or_overdue
    orders = Order.due_soon_or_overdue.to_a

    return if orders.empty?

    all.each do |user|
      UserMailer.orders_due_soon_or_overdue_email(user, orders).deliver
    end
  end
end

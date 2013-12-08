class AddReceiveDueOrdersEmailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :receive_due_orders_emails, :boolean, default: true
  end
end

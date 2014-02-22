class AddTotalToOrder < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.money :total
    end
    Order.all.each do |o|
      o.items.first.update_attribute :updated_at, Time.now
    end
  end
end

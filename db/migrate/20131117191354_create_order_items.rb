class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.money :price
      t.string :notes
      t.integer :quantity, default: 0
      t.belongs_to :order
      t.belongs_to :service

      t.timestamps
    end
  end
end

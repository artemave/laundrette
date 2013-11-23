class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.money :price
      t.text :details
      t.integer :quantity, default: 0
      t.belongs_to :order
      t.belongs_to :item_type
      t.references :color

      t.timestamps
    end
  end
end

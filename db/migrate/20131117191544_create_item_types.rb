class CreateItemTypes < ActiveRecord::Migration
  def change
    create_table :item_types do |t|
      t.string :name
      t.money :default_price

      t.timestamps
    end
  end
end

class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.money :default_price_per_item

      t.timestamps
    end
  end
end

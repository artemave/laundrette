class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :due_date
      t.string :sticker_number
      t.string :status
      t.text :notes
      t.belongs_to :customer

      t.timestamps
    end
  end
end

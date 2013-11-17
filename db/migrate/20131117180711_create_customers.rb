class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.string :phone
      t.text :notes

      t.timestamps
    end
  end
end

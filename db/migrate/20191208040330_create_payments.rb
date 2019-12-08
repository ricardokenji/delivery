class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.integer :order_id, null: false
      t.string :type
      t.decimal :value, precision: 10, scale: 2

      t.timestamps
    end
  end
end

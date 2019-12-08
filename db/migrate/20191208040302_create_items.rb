class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :order_id, null: false
      t.string :external_code, null: false
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.integer :quantity
      t.decimal :total, precision: 10, scale: 2

      t.timestamps
    end
  end
end

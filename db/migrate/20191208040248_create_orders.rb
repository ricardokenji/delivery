class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :external_code, null: false
      t.string :store_id, null: false
      t.decimal :sub_total, precision: 10, scale: 2
      t.decimal :delivery_fee, precision: 10, scale: 2
      t.decimal :total, precision: 10, scale: 2
      t.string :country
      t.string :state
      t.string :city
      t.string :district
      t.string :street
      t.string :complement
      t.decimal :latitude, precision: 5, scale: 6
      t.decimal :longitude, precision: 5, scale: 6
      t.timestamp :dt_order_create
      t.string :postal_code
      t.string :number

      t.timestamps
    end
  end
end

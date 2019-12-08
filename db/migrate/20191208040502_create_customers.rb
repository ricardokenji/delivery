class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.integer :order_id, null: false
      t.string :external_code, null: false
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone_area_code
      t.string :phone_number

      t.timestamps
    end
  end
end

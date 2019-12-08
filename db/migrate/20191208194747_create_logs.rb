class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.integer :order_id
      t.string :status
      t.string :message

      t.timestamps
    end
  end
end

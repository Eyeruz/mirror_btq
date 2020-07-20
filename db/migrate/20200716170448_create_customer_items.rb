class CreateCustomerItems < ActiveRecord::Migration
  def change
    create_table :customer_items do |t|
        t.string :customer_id
        t.string :item_id
        

      t.timestamps null: false
    end
  end
end

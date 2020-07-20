class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.float :price
      t.string :name
      t.boolean :bagged
      t.timestamps null: false
    end
  end
end

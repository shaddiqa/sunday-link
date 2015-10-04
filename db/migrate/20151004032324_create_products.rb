class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :price
      t.string :name
      t.integer :quantity
      t.text :link
      t.integer :vt_id
      t.integer :socmed_id

      t.timestamps null: false
    end
  end
end

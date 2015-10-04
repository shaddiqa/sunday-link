class CreateSocmeds < ActiveRecord::Migration
  def change
    create_table :socmeds do |t|
      t.integer :product_id
      t.string :type
      t.integer :page
      t.integer :per_page

      t.timestamps null: false
    end
  end
end

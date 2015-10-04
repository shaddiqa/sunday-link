class CreateProducts < ActiveRecord::Migration
  def change
    create_table(:products, id: false) do |t|
      t.string :id, primary_key: true
      t.integer :gross_amount
      t.string :name
      t.text :link

      t.timestamps null: false
    end
  end
end

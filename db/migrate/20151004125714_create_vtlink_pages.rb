class CreateVtlinkPages < ActiveRecord::Migration
  def change
    create_table :vtlink_pages do |t|
      t.integer :page
      t.integer :per_page

      t.timestamps null: false
    end
  end
end

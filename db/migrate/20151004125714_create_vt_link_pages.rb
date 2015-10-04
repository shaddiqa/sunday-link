class CreateVtLinkPages < ActiveRecord::Migration
  def change
    create_table :vt_link_pages do |t|
      t.integer :page
      t.integer :per_page

      t.timestamps null: false
    end
  end
end

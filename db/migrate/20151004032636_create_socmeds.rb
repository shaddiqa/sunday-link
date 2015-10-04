class CreateSocmeds < ActiveRecord::Migration
  def change
    create_table(:social_medias, id: false) do |t|
      t.string :id, primary_key: true
      t.integer :product_id
      t.string :media
      t.text :auth_params

      t.timestamps null: false
    end
  end
end

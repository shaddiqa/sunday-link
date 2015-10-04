class CreateSocialMedias < ActiveRecord::Migration
  def change
    create_table(:social_medias, id: false) do |t|
      t.string :id, primary_key: true
      t.string :product_id
      t.integer :media
      t.text :auth_params

      t.timestamps null: false
    end
  end
end

class CreateFacebookComments < ActiveRecord::Migration
  def change
    create_table :facebook_comments, id: false do |t|
      t.string :id, primary_key: true
      t.string :message
      t.string :user_id
      t.string :social_media_id

      t.timestamps null: false
    end
  end
end

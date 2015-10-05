class CreateTwitterReplies < ActiveRecord::Migration
  def change
    create_table :replies, id: false do |t|
      t.string :id, primary_key: true
      t.text :message
      t.string :social_media_id
      t.string :user_id

      t.timestamps null: false
    end
  end
end

class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :message
      t.string :social_media_id
      t.string :user_id

      t.timestamps null: false
    end
  end
end

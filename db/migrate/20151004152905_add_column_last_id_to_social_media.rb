class AddColumnLastIdToSocialMedia < ActiveRecord::Migration
  def change
    add_column :social_medias, :last_id, :string
  end
end

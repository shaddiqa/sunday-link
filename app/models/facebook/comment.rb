module Facebook
  class Comment < ActiveRecord::Base
    self.table_name = "facebook_comments"

    belongs_to :social_medias, class_name: "SocialMedia"
  end
end

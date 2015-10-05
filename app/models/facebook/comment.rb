module Facebook
  class Comment < ActiveRecord::Base
    self.table_name = "facebook_comments"
    self.primary_key = "id"
  end
end

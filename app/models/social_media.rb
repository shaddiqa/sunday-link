class SocialMedia < ActiveRecord::Base
  self.table_name = "social_medias"
  self.primary_key = "id"

  belongs_to :products, class_name: "Product"
  has_many :facebook_comments, class_name: "Facebook::Comment", foreign_key: "social_media_id"
  has_many :tweet_replies, class_name: "Twitter::Reply", foreign_key: "social_media_id"

  enum media: %w(facebook twitter)
end

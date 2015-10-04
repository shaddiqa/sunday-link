class SocialMedia < ActiveRecord::Base
  enum media: %w(facebook twitter)
end

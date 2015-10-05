class FetchSocialMedia
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely(15) }
  sidekiq_options queue: :fetch_social_media

  def perform
    SocialMedia.all.each do |social_media|

      case social_media.media
      when "twitter"
        twitter = TwitterClient.new(JSON.parse(social_media.auth_params))
        twitter.fetch_mentions(social_media.id, social_media.last_id)
      when "facebook"
        token =JSON.parse(social_media.auth_params)['access_token']
        facebook = FacebookClient.new(token)
        facebook.fetch_comments(social_media.id, social_media.last_id)
      end
    end
  end
end

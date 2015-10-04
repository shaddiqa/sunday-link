class TwitterClient
  MAX_FETCH_LIMIT = 10

  attr_reader :status


  def initialize auth_credentials = {}
    @client ||= Twitter::REST::Client.new auth_credentials
  end

  def fetch_mentions social_media_id, since_id
    social_media = SocialMedia.find(social_media_id)
    if social_media
      mentions = all_mentions.select{|x| x.in_reply_to_status_id.to_s == social_media.id.to_s}
      mentions.each do |mention|
        replay = social_media.tweet_replies.new(user_id: mention.user.id, message: mention.full_text)
        replay.save
      end
      if !all_mentions.blank?
        social_media.update(last_id: all_mentions.last.id)
      end
      return mentions
    else
      return []
    end
  end

  private

    def all_mentions
      args = {count: MAX_FETCH_LIMIT}
      args.merge!(since_id: @since_id) if @since_id
      @all_mentions ||= @client.mentions_timeline(args)
    end
end

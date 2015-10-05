class TwitterClient
  attr_reader :status

  def initialize auth_credentials = {}
    @client ||= Twitter::REST::Client.new auth_credentials
  end

  def fetch_mentions social_media_id, since_id
    social_media = SocialMedia.find_or_initialize_by(id: social_media_id)

    if social_media
      replies = all_mentions(since_id).select{|x| x.in_reply_to_status_id.to_s == social_media.id.to_s}

      replies.each do |reply|
        social_media.tweet_replies.find_or_initialize_by(id: reply.id) do |tmp|
          tmp.id = reply.id
          tmp.message = reply.full_text
          tmp.user_id = reply.user.id
          tmp.save
        end
      end

      social_media.update(last_id: all_mentions.last.id) unless replies.blank?

      return replies
    else
      return []
    end
  end

  private

    def all_mentions since_id=nil
      args = {count: ENV["TWITTER_MAX_FETCH_LIMIT"].to_i}
      args = args.merge(since_id: since_id) unless since_id.nil?

      @client.mentions_timeline(args)
    end
end

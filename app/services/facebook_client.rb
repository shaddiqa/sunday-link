class FacebookClient
  MAX_FETCH_LIMIT = 10

  def initialize token
    @token    = token
    @facebook = Koala::Facebook::API.new(token)
  end

  def fetch_comments post_id, last_cursor = nil
    comments = @facebook.get_connections(post_id, "comments", limit: MAX_FETCH_LIMIT, filter: 'stream', after: last_cursor)
    last_cursor = comments.paging["cursors"]["after"]

    comments.each do |comment|
        Facebook::Comment.find_or_initialize_by(id: comment["id"]) do |tmp|
        tmp.id = comment["id"]
        tmp.message = comment["message"]
        tmp.user_id = comment["from"]["id"]
        tmp.save
      end
    end

    social_media = SocialMedia.find(post_id)
    social_media.last_id = last_cursor
    social_media.update

    comments
  end

end

class FacebookClient

  def initialize token
    @facebook ||= Koala::Facebook::API.new(token)
  end

  def fetch_comments post_id, last_cursor = nil
    comments = @facebook.get_connections(post_id, "comments", limit: ENV["FACEBOOK_MAX_FETCH_LIMIT"].to_i, filter: "stream", after: last_cursor)

    unless comments.blank?
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
      social_media.update(last_id: last_cursor)
    end

    return comments
  end

end

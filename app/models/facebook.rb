class Facebook
  def initialize token, message, fb_id
    @message  = message
    @token    = token
    @fb_id    = fb_id
    @facebook = Koala::Facebook::API.new(token)
  end
  def get_object_facebook
    @facebook.get_object(@fb_id)
  end
end

class SessionsController < ActionController::Base
  def create
    user = request.env['omniauth.auth']['credentials']['token']
    binding.pry
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'SJTVmZBRzUC9QdZXbOfZgA'
      config.consumer_secret     = 'f2oaYS2jLA6ruDi8lYsHGpNKxw1kcqsUsPiSpNstURQ'
      config.access_token        = request.env['omniauth.auth']['credentials']['token']
      config.access_token_secret = request.env['omniauth.auth']['credentials']['secret']
    end
    binding.pry
    # facebook = Koala::Facebook::API.new(user)
    # data = facebook.get_object("me?fields=name,picture")
    # binding.pry
    # fb = facebook.put_wall_post("hey, testing long time access token")
    binding.pry
  end
end

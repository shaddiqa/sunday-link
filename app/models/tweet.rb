module Twitter
  class Tweet

    def initialize consumer_key, consumer_secret, access_token, access_token_secret, id_twitter
      @twitter_id = id_twitter

      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = consumer_key
        config.consumer_secret     = consumer_secret
        config.access_token        = access_token
        config.access_token_secret = access_token_secret
      end
    end

    def check_status
      @client.status(@id_twitter)
    end

    def mentions_timeline
      @client.mentions_timeline
    end
    
  end
end

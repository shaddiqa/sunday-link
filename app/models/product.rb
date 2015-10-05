class Product < ActiveRecord::Base
  NUMBER_OF_PRODUCTS_FETCH_LIMIT = 100
  NUMBER_OF_TRENDING_PRODUCT = 5

  self.primary_key = "id"

  validates :gross_amount, :name, :id, :link, presence: true
  has_many :social_medias

  scope :most_recents, -> { order(:created_at).limit(NUMBER_OF_PRODUCTS_FETCH_LIMIT) }

  attr_accessor :score

  def self.trending
    products = []

    most_recents.each do |product|
      score = 0

      product.social_medias.each do |social_media|

        case social_media.media
        when "twitter"
          score += social_media.tweet_replies.size
        when "facebook"
          score += social_media.facebook_comments.size
        end

      end

      product.score = score
      products << product
    end

    products = products.sort_by{|x| x.score}.reverse
    products.slice(0, NUMBER_OF_TRENDING_PRODUCT)
  end
end

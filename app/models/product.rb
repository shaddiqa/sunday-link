class Product < ActiveRecord::Base
  NUMBER_OF_PRODUCTS_FETCH_LIMIT = 100

  self.primary_key = "id"

  validates :gross_amount, :name, :id, :link, presence: true
  has_many :social_medias

  scope :most_recents, -> { order(:created_at).limit(NUMBER_OF_PRODUCTS_FETCH_LIMIT) }
end

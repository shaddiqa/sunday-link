class Product < ActiveRecord::Base
  self.primary_key = "id"
  validates :gross_amount, :name, :id, :link, presence: true
  has_many :social_medias
end

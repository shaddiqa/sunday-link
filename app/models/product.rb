class Product < ActiveRecord::Base
  validates :gross_amount, :name, :link, presence: true
  has_many :social_medias
end

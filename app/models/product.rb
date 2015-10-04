class Product < ActiveRecord::Base
  validates :price, :name, :quantity, :link, :vt_id, :socmed_id, presence: true
end

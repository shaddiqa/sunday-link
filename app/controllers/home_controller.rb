class HomeController < ApplicationController
  def index
    @products = Product.trending
  end
end

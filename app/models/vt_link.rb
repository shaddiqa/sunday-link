class VtLink
  include HTTParty
  base_uri ENV["URI_TURBO"]

  def fetch_sample_api
    page = VtLinkPage.first
    data_api = self.class.get("/api/v1/posts?per_page=#{page.per_page}&page=#{page.page}")
    total_page = data_api["total_page"]
    return false if  page.page >= total_page
    data_api["data"].each do |product|
      puts product
      # unless Product.find_by_vt_id(product.id)
      #   @product = Product.create(name: product.name, vt_id: product.id, link: product.link)
      #   data_api["social_medias"].each do |socmed|
      #     @product = SocialMedia.create(media: product.media, socmed_id: product.id)
      #   end
      # end
    end
    page.update(page: page.page + 1) if data_api["data"].count >= page.per_page
  end
end

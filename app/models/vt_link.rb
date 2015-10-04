class VtLink
  include HTTParty
  base_uri ENV["URI_TURBO"]

  def fetch_sample_api
    # get page & per_page for auto increment
    page = VtLinkPage.first
    data_api = self.class.get("/api/v1/vtlinks.json?per_page=#{page.per_page}&page=#{page.page}")
    total_page = data_api["total_page"]
    data_api["data"].each do |product|
      vt_product = Product.find_by_id(product["id"])
      unless vt_product
        ## create product
        Product.create(id: product["id"], name: product["name"], 
                       gross_amount: product['gross_amount'], link: product['link'])
        product["social_medias"].each do |socmed|
          SocialMedia.create(media: socmed['media'], id: socmed['id'], auth_params: socmed['auth_params'].to_json)
        end
      end
    end
    page.update(page: page.page + 1) if data_api["data"].count >= page.per_page
  end
end

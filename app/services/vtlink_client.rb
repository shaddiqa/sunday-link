class VtlinkClient
  MAX_FETCH_LIMIT = 10
  include HTTParty
  base_uri ENV["URI_TURBO"]

  def fetch_product_vtlink
    # get page & per_page for automation paging
    # create VtLinkPage.create(page: 1, per_page: 10)
    page = VtLinkPage.first
    data_api = self.class.get("/api/v1/vtlinks.json?per_page=#{MAX_FETCH_LIMIT}&page=#{page.page}")
    total_page = data_api["total_page"]
    data_api["data"].each do |product|
      vt_product = Product.find_by_id(product["id"])
      unless vt_product
        ## create product
        Product.create(id: product["id"], name: product["name"], 
                       gross_amount: product['gross_amount'], link: product['link'])
        ## create social Media
        product["social_medias"].each do |socmed|
          SocialMedia.create(media: socmed['media'], product_id: product["id"], 
                             id: socmed['id'], auth_params: socmed['auth_params'].to_json)
        end
      end
    end
    # update page after data_api == data.per_page
    page.update(page: page.page + 1) if data_api["data"].count == MAX_FETCH_LIMIT
  end
end

class VtlinkClient
  include HTTParty

  base_uri ENV["TURBO_URI"]

  def fetch_product_vtlink
    vtlink_page = VtlinkPage.first
    response_body = self.class.get("/api/v1/vtlinks.json?per_page=#{ENV['VTLINK_MAX_FETCH_LIMIT'].to_i}&page=#{vtlink_page.page}")

    response_body["data"].each do |product|
      Product.find_or_initialize_by(id: product["id"]) do |tmp|
        tmp.id = product["id"]
        tmp.name = product["name"]
        tmp.gross_amount = product["gross_amount"]
        tmp.link = product["link"]
        tmp.save

        product["social_medias"].each do |social_media|
          SocialMedia.create(media: social_media['media'], product_id: product["id"],
                             id: social_media['id'], auth_params: social_media['auth_params'].to_json)
        end
      end
    end

    vtlink_page.update(page: vtlink_page.page + 1) if response_body["data"].count == ENV['VTLINK_MAX_FETCH_LIMIT'].to_i
  end
end

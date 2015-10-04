class VtLink
  include HTTParty
  base_uri 'http://localhost:3000'

  def fetch_sample_api
    data_api = self.class.get('/api/v1/posts')
    total_page = data_api["total_data"]
    if total_page > 1
      [2..total_page].each_with_index do |page, index|
        data_api = self.class.get("/api/v1/posts?per_page=#{index}")
        data_api["data"].each do |product|
        # insert product
        end
      end
    else
      data_api["data"].each do |product|
      # insert product
      end
    end
  end
end

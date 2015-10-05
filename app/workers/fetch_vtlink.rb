class FetchVtlink
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely(15) }
  sidekiq_options queue: :fetch_social_media

  def perform
    vtlink = VtlinkClient.new
    vtlink.fetch_product_vtlink
  end
end

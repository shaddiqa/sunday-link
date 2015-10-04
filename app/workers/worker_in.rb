class WorkerIn
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  recurrence { minutely }
  def perform id
  end
end

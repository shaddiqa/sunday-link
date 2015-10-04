class WorkerOut
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  recurrence { minutely }
  def perform
  end
end

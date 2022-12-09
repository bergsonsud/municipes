class EmailNotifyWorker
  include Sidekiq::Worker

  def perform(email)
    NotifyMailer.notify(email).deliver
  end
end

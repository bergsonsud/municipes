class SmsNotifyWorker
  include Sidekiq::Worker

  def perform(number, message)
    Twilio::REST::Client.new.messages.create(
      from: ENV.fetch('TWILIO_NUMBER'),
      to: number,
      body: message
    )
  end
end

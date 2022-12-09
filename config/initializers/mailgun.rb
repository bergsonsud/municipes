if Rails.env.production? || Rails.env.development?
  ActionMailer::Base.smtp_settings = {
    address:              ENV['SMTP_ADDRESS'],
    port:                 ENV['SMTP_PORT'],
    domain:               ENV['SMTP_DOMAIN'],
    user_name:            ENV['SMTP_USERNAME'],
    password:             ENV['SMTP_PASSWORD'],
    authentication:       :plain,
    enable_starttls_auto: true
  }

  ActionMailer::Base.delivery_method = :smtp

  ActionMailer::Base.default from: ENV['SMTP_FROM']
end
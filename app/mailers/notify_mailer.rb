# frozen_string_literal: true

class NotifyMailer < ActionMailer::Base
  def notify(email)
    mail(to: email, subject: 'Municipe Criado')
  end
end

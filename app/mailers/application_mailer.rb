class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.sendgrid.dig(:sender_address)
  layout 'mailer'
end

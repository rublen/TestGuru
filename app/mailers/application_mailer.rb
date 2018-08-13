class ApplicationMailer < ActionMailer::Base
  default from: %{"testGuru" <aprilsunday.lr@gmail.com>}
  layout 'mailer'
end

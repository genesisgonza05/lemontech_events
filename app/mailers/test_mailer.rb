class TestMailer < ApplicationMailer
  def sample_email
    mail(to: 'test@example.com', subject: 'Test Email')
  end
end

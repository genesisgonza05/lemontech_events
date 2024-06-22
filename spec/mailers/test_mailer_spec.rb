require 'rails_helper'

RSpec.describe TestMailer, type: :mailer do
  describe 'default settings' do
    let(:mail) { TestMailer.sample_email }

    it 'sets the default from address' do
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'uses the mailer layout' do
      expect(mail.body.encoded).to match(/Hello, this is a test email./)
    end
  end
end

require 'rails_helper'

RSpec.describe ApplicationMailer, type: :mailer do
  describe 'default settings' do
    it 'sets the default from address' do
      expect(ApplicationMailer.default[:from]).to eq('from@example.com')
    end
  end
end

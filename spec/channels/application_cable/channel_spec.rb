require 'rails_helper'

RSpec.describe ApplicationCable::Channel, type: :channel do
  it 'inherits from ActionCable::Channel::Base' do
    expect(ApplicationCable::Channel.superclass).to be(ActionCable::Channel::Base)
  end
end

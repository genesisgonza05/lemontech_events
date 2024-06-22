require 'rails_helper'

RSpec.describe ApplicationCable::Connection, type: :channel do
  it 'inherits from ActionCable::Connection::Base' do
    expect(ApplicationCable::Connection.superclass).to be(ActionCable::Connection::Base)
  end
end

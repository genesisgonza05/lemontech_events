require 'rails_helper'

RSpec.describe Participation, type: :model do
  let(:user) { create(:user) }
  let(:event) { create(:event, user: create(:user)) }
  let(:participation) { build(:participation, user: user, event: event) }

  subject { participation }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a user' do
      subject.user = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without an event' do
      subject.event = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid if the user is already registered for the event' do
      create(:participation, user: user, event: event)
      expect(subject).not_to be_valid
      expect(subject.errors[:user_id]).to include('ya está registrado en este evento')
    end
  end

  context 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'belongs to an event' do
      association = described_class.reflect_on_association(:event)
      expect(association.macro).to eq :belongs_to
    end
  end
end

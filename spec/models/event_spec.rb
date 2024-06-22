require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { create(:user) }
  let(:event) { create(:event, user: user) }

  subject { event }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with a name longer than 255 characters' do
      subject.name = 'a' * 256
      expect(subject).not_to be_valid
    end

    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without an event_date_time' do
      subject.event_date_time = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a location' do
      subject.location = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with a location longer than 255 characters' do
      subject.location = 'a' * 256
      expect(subject).not_to be_valid
    end

    it 'is not valid without a capacity' do
      subject.capacity = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid with a non-integer capacity' do
      subject.capacity = 'a'
      expect(subject).not_to be_valid
    end

    it 'is not valid with a capacity less than 1' do
      subject.capacity = 0
      expect(subject).not_to be_valid
    end

    it 'is not valid without requirements' do
      subject.requirements = nil
      expect(subject).not_to be_valid
    end
  end

  describe '.ransackable_associations' do
    it 'returns the correct ransackable associations' do
      expect(Event.ransackable_associations).to eq(['user'])
    end
  end
end

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

    it "is not valid if event_date_time is in the past" do
      subject.event_date_time = 1.day.ago
      expect(subject).not_to be_valid
      expect(subject.errors[:event_date_time]).to include(I18n.t("activerecord.errors.models.event.attributes.event_date_time.time_in_pass"))
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

  describe '.ransackable_attributes' do
    it 'returns the correct ransackable attributes' do
      expect(Event.ransackable_attributes).to eq(%w[id name event_date_time capacity])
    end
  end

  describe '.ransackable_associations' do
    it 'returns the correct ransackable associations' do
      expect(Event.ransackable_associations).to eq(['user'])
    end
  end

  describe '.sort_column' do
    it 'returns the correct column when valid' do
      expect(Event.sort_column('name')).to eq('name')
    end

    it 'returns the default column when invalid' do
      expect(Event.sort_column('invalid_column')).to eq(Event::DEFAULT_SORT)
    end
  end

  describe '.sort_direction' do
    it 'returns the correct direction when valid' do
      expect(Event.sort_direction('asc')).to eq('asc')
    end

    it 'returns the default direction when invalid' do
      expect(Event.sort_direction('invalid_direction')).to eq(Event::DEFAULT_DIR)
    end
  end
end

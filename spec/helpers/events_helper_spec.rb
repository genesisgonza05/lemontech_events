require 'rails_helper'

RSpec.describe EventsHelper, type: :helper do
  describe '#long_formatted_date_time' do
    it 'returns the formatted date and time' do
      date_time = DateTime.new(2024, 6, 21, 14, 35)
      result = helper.long_formatted_date_time(date_time)
      expect(result).to eq('21/06/2024 14:35')
    end

    it 'returns an error message for invalid date' do
      result = helper.long_formatted_date_time(nil)
      expect(result).to eq('Fecha no válida')
    end

    it 'rescues and returns an error message for unexpected errors' do
      allow_any_instance_of(DateTime).to receive(:strftime).and_raise(StandardError)
      date_time = DateTime.new(2024, 6, 21, 14, 35)
      result = helper.long_formatted_date_time(date_time)
      expect(result).to eq('Fecha no válida')
    end
  end
end

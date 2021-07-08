require 'journey'

describe Journey do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey) { Journey.new(entry_station) }
  context 'When only given an entry station' do
    before(:each) do
      journey = Journey.new(entry_station)
    end

    it 'it records the entry station' do
      expect(journey.entry_station).to eq(entry_station)
    end

    it 'Default fare is penalty value' do
      expect(subject.fare).to eq(Journey::PENALTY_FARE)
    end
  end

  context 'When given an entrance and exit station' do
    before(:each) do
      journey.leave_station(exit_station)
    end

    it 'Will store journey on touch out' do
      expect(journey.record).to include(entry_station => exit_station)
    end

    it 'Will charge minimum fare' do
      expect(journey.fare).to eq(Journey::MINIMUM_FARE)
    end
  end
end

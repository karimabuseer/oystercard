require 'journey'

describe Journey do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey) { Journey.new(entry_station, 1) }
  let(:zone1) { 1 }
  context 'When only given an entry station' do
    before(:each) do
      journey = Journey.new(entry_station, zone1)
    end

    it 'it records the entry station' do
      expect(journey.entry_station.name).to eq(entry_station)
    end

    it 'Default fare is penalty value' do
      expect(subject.fare).to eq(Journey::PENALTY_FARE)
    end
  end

  context 'When given an entrance and exit station' do
    before(:each) do
      journey.leave_station(exit_station, 5)
    end

    it 'Will store journey on touch out' do
      expect(journey.record).to include(journey.entry_station.name => journey.exit_station.name)
    end

    it 'Will charge correct fare with touch in zone 1, touch out zone 5' do
      expect(journey.fare).to eq(5)
    end
  end
end

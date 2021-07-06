require 'journey'

describe Journey do
  let (:entry_station) {double :entry_station}
  let (:exit_station) {double :exit_station }
  it 'Will store journey on touch out' do
    journey1 = Journey.new(entry_station)
    journey1.leave_station(exit_station)
    expect(journey1.log).to include(entry_station => exit_station)
  end

  it 'Default fare is penalty value' do
    expect(subject.fare).to eq(6)
  end
end
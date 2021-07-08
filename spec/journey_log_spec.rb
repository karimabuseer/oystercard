require 'journey_log'

describe JourneyLog do
  it { is_expected.to respond_to(:start).with(1).argument }
  let(:station) { double :station }

  it 'is initialised with an array to store journeys' do
    expect(subject.journeys).to be_instance_of(Array)
  end

  it 'is expected to init with no journey class' do
    expect(subject.journey_class).to eql(nil)
  end

  it 'is expected to store starting station' do
    subject.start(station)
    expect(subject.journey_class.entry_station).to eq(station)
  end

  it 'is expected to store entrance and exit station' do
    subject.finish(station)
    expect(subject.journey_class.exit_station).to eq(station)
  end

  it 'is expected to create record of Journey' do
    subject.start(station)
    subject.finish(station)
    expect(subject.journeys).to include{station => station}
  end

  it '#fare returns penalty if no entry station' do
    subject.finish(station)
    expect(subject.fare).to eq(Journey::PENALTY_FARE)
  end


end

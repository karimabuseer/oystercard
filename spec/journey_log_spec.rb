require 'journey_log'

describe JourneyLog do
  it { is_expected.to respond_to(:start).with(1).argument }

  it 'is initialised with an array to store journeys' do
    expect(subject.journeys).to be_instance_of(Array)
  end
end

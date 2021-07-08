require 'station'

describe Station do
  let(:station) { Station.new('EC', 5) }
  it 'has a name' do
    expect(station).to respond_to(:name)
  end

  it 'sets name' do
    expect(station.name).to eq('EC')
  end

  it 'sets zone' do
    expect(station.zone).to eq(5)
  end
end

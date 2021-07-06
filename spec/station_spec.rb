require 'station'

describe Station do
  let (:station) { Station.new('EC', 5)}
  it 'has a name' do
    expect(station).to respond_to(:name)
  end

  it 'has a zone' do
    expect(station).to respond_to(:zone)
  end
end
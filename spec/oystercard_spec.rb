require 'oystercard'

describe Oystercard do
  let (:top_up_fiver) { subject.top_up(5.00) }
  let (:lim) { Oystercard::DEFAULT_LIMIT }

  it 'Can store money and has default balance' do
    expect(subject).to respond_to(:balance)
  end

  it 'Has a default balance' do
    expect(subject.balance).to eq(0.00)
  end

  it 'Can be topped up by a certain amount' do
    top_up_fiver
    expect(subject.balance).to eq(5.00)
  end

  it "Doesn't allow being topped up over £90" do
    subject.top_up(lim)
    expect { subject.top_up(0.01) }.to raise_error("Sorry, top-up limit (£#{lim}) reached")
  end

  it 'Allows money to be deducted' do
    top_up_fiver
    expect(subject.deduct(1.50)).to eq(3.50)
  end

  it 'Has a bool function that checks if card in journey' do
    expect(subject).to respond_to(:in_journey?)
  end

  it 'Touch in sets in journey to true' do
    subject.touch_in
    expect(subject.in_journey?).to eq(true)
  end

  it 'Card starts out as not in use' do
    expect(subject.in_journey?).to eq(false)
  end

  it 'Touch out sets in journey to false' do
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey?).to eq(false)
  end
end
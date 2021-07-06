require 'oystercard'

describe Oystercard do
  let (:top_up_fiver) { subject.top_up(5.00) }
  let (:lim) { Oystercard::DEFAULT_LIMIT } 
  let (:min) { Oystercard::MINIMUM_AMOUNT }
  let (:start_journey) { subject.top_up(10) ; subject.touch_in('East Croydon') }
  
  before(:each) do
    entry_station = double('Trafalgar Square')
  end

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
    expect { top_up_fiver }.to raise_error("Sorry, top-up limit (£#{lim}) reached")
  end

  it 'Allows money to be deducted' do
    top_up_fiver
    expect(subject.send(:deduct,1.50)).to eq(3.50)
  end

  it 'Has a bool function that checks if card in journey' do
    expect(subject).to respond_to(:in_journey?)
  end

  it 'Touch in sets in journey to true' do
    start_journey
    expect(subject.in_journey?).to eq(true)
  end

  it 'Card starts out as not in use' do
    expect(subject.in_journey?).to eq(false)
  end

  it 'Touch out sets in journey to false' do
    start_journey
    subject.touch_out
    expect(subject.in_journey?).to eq(false)
  end

  it 'Expect touching in without min amount to raise error' do
    expect { subject.touch_in('East Croydon') }.to raise_error("Sorry, minimum amount needed of £#{min}")
  end

  it 'Expect touching out to cause fee deduction' do
    start_journey
    subject.touch_out
    expect { subject.touch_out }.to change{ subject.balance }.by(min * -1)
  end

  it 'Expect touch in to require an argument' do
    expect(subject).to respond_to(:touch_in).with(1).argument
  end

  it 'Expect touch in to store entry station' do
    subject.top_up(5)
    subject.touch_in('East Croydon')
    expect(subject.entry_station).to eq('East Croydon')
  end

  it 'Expect touch out to set entry station to nil' do
    start_journey
    subject.touch_out
    expect(subject.entry_station).to eql(nil)
  end
end
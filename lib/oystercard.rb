class Oystercard
  attr_reader :balance , :entry_station
  DEFAULT_LIMIT = 90
  MINIMUM_AMOUNT = 1
  def initialize(balance = 0.00)
    @balance = balance
    @entry_station
    @exit_station
    @journey_history = []
  end

  def top_up(topup)
    @balance + topup > DEFAULT_LIMIT ? 
    (raise "Sorry, top-up limit (£#{DEFAULT_LIMIT}) reached") : @balance += topup
  end

  def in_journey?
    !@entry_station.nil?
  end

  def touch_in(entry_station) 
     (raise "Sorry, minimum amount needed of £#{MINIMUM_AMOUNT}") if @balance < MINIMUM_AMOUNT
     @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_AMOUNT)
    @exit_station = exit_station
    update_history
    @entry_station = nil
  end

  def journey_history
    @journey_history
  end

  def update_history
    @journey_history << { @entry_station => @exit_station }
  end

  private 

  def deduct(cost)
    @balance -= cost
  end

end

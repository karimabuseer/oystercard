class Oystercard
  attr_reader :balance , :entry_station
  DEFAULT_LIMIT = 90
  MINIMUM_AMOUNT = 1
  def initialize(balance = 0.00)
    @balance = balance
    @in_use = false
    @entry_station
  end

  def top_up(topup)
    @balance + topup > DEFAULT_LIMIT ? 
    (raise "Sorry, top-up limit (£#{DEFAULT_LIMIT}) reached") : @balance += topup
  end

  def in_journey?
    @in_use
  end

  def touch_in(entry_station)
    @entry_station = entry_station 
    @balance >= MINIMUM_AMOUNT ?
    @in_use = true : (raise "Sorry, minimum amount needed of £#{MINIMUM_AMOUNT}")
  end

  def touch_out
    deduct(MINIMUM_AMOUNT)
    @in_use = false
  end

  private 

  def deduct(cost)
    @balance -= cost
  end

end

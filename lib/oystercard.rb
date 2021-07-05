class Oystercard
  attr_reader :balance 
  DEFAULT_LIMIT = 90
  def initialize(balance = 0.00)
    @balance = balance
    @in_use = false
  end

  def top_up(topup)
    @balance + topup > DEFAULT_LIMIT ? 
    (raise "Sorry, top-up limit (£#{DEFAULT_LIMIT}) reached") : @balance += topup
  end

  def deduct(cost)
    @balance -= cost
  end

  def in_journey?
    @in_use
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

end

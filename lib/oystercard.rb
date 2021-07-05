class Oystercard
  attr_reader :balance 
  DEFAULT_LIMIT = 90
  def initialize(balance = 0.00)
    @balance = balance
  end

  def top_up(topup)
    @balance + topup > DEFAULT_LIMIT ? 
    (raise "Sorry, top-up limit (£#{DEFAULT_LIMIT}) reached") : @balance += topup
  end

  # def deduct(cost)
  #   @balance -= cost
  # end
end

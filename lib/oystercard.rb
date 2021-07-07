require_relative 'station'
require_relative 'journey_log'

class Oystercard
  attr_reader :balance , :entry_station, :current_journey
  DEFAULT_LIMIT = 90
  MINIMUM_AMOUNT = 1

  def initialize(balance = 0.00)
    @balance = balance
    @current_journey
    @journey_history = JourneyLog.new
  end

  def top_up(topup)
    top_up_limit(topup)
    @balance += topup
  end

  def top_up_limit(topup)
    raise "Sorry, top-up limit (£#{DEFAULT_LIMIT}) reached" if @balance + topup > DEFAULT_LIMIT
  end

  def in_journey?
    !@current_journey.nil?
  end

  def touch_in(entry_station)
    minimum_check
    @journey_history.start(entry_station)
  end

  def minimum_check
    (raise "Sorry, minimum amount needed of £#{MINIMUM_AMOUNT}") if @balance < MINIMUM_AMOUNT
  end

  def touch_out(exit_station)
    @journey_history.finish(exit_station)
    deduct(@journey_history.fare)
  end

  def journey_history
    @journey_history.journeys
  end

  private 

  def deduct(cost)
    @balance -= cost
  end

end

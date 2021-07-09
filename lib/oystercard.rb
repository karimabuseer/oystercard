require_relative 'station'
require_relative 'journey_log'

class Oystercard
  attr_reader :balance, :entry_station, :journey_log

  DEFAULT_LIMIT = 90
  MINIMUM_AMOUNT = 1

  # Init with no balance + new log
  def initialize(balance = 0.00)
    @balance = balance
    @journey_log = JourneyLog.new
  end

  ##TOP-UP METHODS## Can be improved by limit to .2sf
  def top_up(topup)
    top_up_check(topup)
    @balance += topup
  end

  ##TOUCH-IN AND TOUCH-OUT##
  # Looks busy, but just calling methods. Can I split this out
  def touch_in(entry_station, zone)
    minimum_check
    pen_check
    @journey_log.start(entry_station, zone)
  end  
      
  def touch_out(exit_station, zone)
    @journey_log.finish(exit_station, zone)
    deduct(@journey_log.fare)
    @journey_log.complete
  end

  ##PENALTY AND ERROR CHECKS##
  # Improve by checking readiblity intuition - better to surround raise with newlines?
  def pen_check
    deduct(@journey_log.fare) if in_journey?
  end

  def minimum_check
    (raise "Sorry, minimum amount needed of £#{MINIMUM_AMOUNT}") if @balance < MINIMUM_AMOUNT
  end

  def top_up_check(topup)
    raise "Sorry, top-up limit (£#{DEFAULT_LIMIT}) reached" if @balance + topup > DEFAULT_LIMIT
  end

  ##JOURNEY-CHECK AND LOG##
  def journey_history
    @journey_log.journeys
  end

  def in_journey?
    @journey_log.journey?
  end

  private

  def deduct(cost)
    @balance -= cost
  end
end

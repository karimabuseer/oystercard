require_relative 'journey'

class JourneyLog
  attr_reader :journeys, :journey_class, :journeys

  def initialize(journey_class = nil)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    @journey_class = Journey.new(entry_station)
  end

  def finish(exit_station)
    current_journey
    @journey_class.leave_station(exit_station)
    update_log
  end

  def fare
    @journey_class.fare
  end

  def journey?
    ! @journey_class.nil?
  end

  def current_journey
    @journey_class ||= Journey.new
  end

  def update_log
    @journeys << @journey_class.record
  end

  def complete
    @journey_class = nil
  end
end

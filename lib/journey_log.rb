require_relative 'journey'

class JourneyLog
  attr_reader :journeys, :journey_class, :journeys

  ## INIT WITH NO JOURNEY
  def initialize(journey_class = nil)
    @journey_class = journey_class
    @journeys = []
  end

  ##START JOURNEY AND FINISH JOURNEY##
  def start(entry_station, zone)
    @journey_class = Journey.new(entry_station, zone)
  end

  def finish(exit_station, zone)
    current_journey
    @journey_class.leave_station(exit_station, zone)
    update_log
  end

  # Creates dupe journey
  def journeys
    fake_journey = @journeys
    fake_journey
  end

  def fare
    @journey_class.fare
  end

  def journey?
    ! @journey_class.nil?
  end

  # Checks if journey already exists; creates standin to allow for penalty when no touch in. 
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

require_relative 'journey'

class JourneyLog
  attr_reader :journeys
  def initialize(journey_class = Journey.new)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    @journey_class = Journey.new(entry_station)
  end

  def finish(exit_station)
    @journey_class.leave_station(exit_station)
    update_log
  end

  def fare
    @journey_class.fare
  end
   
  # def current_journey
  #   @current_journey ||= Journey.new
  # end

  def journeys
    @journeys
  end

  def update_log
    @journeys <<  @journey_class.record
  end

end
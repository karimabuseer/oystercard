require_relative 'journey'

class JourneyLog
  attr_reader :journeys
  def initialize
    @journey_class
    @journeys = []
  end

  def start(entry_station)
  end 
end
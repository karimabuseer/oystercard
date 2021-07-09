require_relative 'station'

class Journey
  attr_reader :entry_station, :exit_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  def initialize(entry_station = nil, zone = nil)
    @entry_station = Station.new(entry_station, zone)
    @exit_station
  end

  def leave_station(exit_station, zone)
    @exit_station = Station.new(exit_station, zone)
  end

  def fare
    @entry_station.name && exit_station.name ? (1 + (@entry_station.zone - @exit_station.zone).abs) : PENALTY_FARE
  end

  def record
    { @entry_station.name => @exit_station.name }
  end
end

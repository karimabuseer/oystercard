class Journey
  attr_reader :entry_station, :exit_station
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station
    @fare = 1
  end

  def leave_station(exit_station)
    @exit_station = exit_station
  end

  def fare
    @entry_station && exit_station ? MINIMUM_FARE : PENALTY_FARE
  end

  def record
    { entry_station => exit_station }
  end



end
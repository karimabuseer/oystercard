class Station
  attr_reader :name, :zone

  def initialize(name, zone)
    @name = name
    @zone = zone
  end

  def entry(entry_station)
    @entry_station = entry_station
  end

  def exit(exit_station)
    @exit_station = exit_station
  end
end

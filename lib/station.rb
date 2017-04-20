require_relative 'oystercard'

class Station
attr_reader :name, :zone

   def initialize(name: name, zone: zone)
    @station_info = []
    @name = name
    @zone = zone
   end
end

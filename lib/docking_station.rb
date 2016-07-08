require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

 def release_bike
   fail "No bikes available" if empty?
   fail "Bike is broken" unless @bikes.last.working?
   @bikes.pop

 end

 def dock(bike)
   fail "Docking station full" if full?
   @bikes << bike
 end

 attr_reader :capacity

private

  attr_reader :bikes

  def full?
   @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end

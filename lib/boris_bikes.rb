class DockingStation
  attr_accessor :name, :storage, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(name, storage=[], capacity=DEFAULT_CAPACITY)
    @name = name
    @storage = storage
    @capacity = capacity
  end

  private def full?
    self.storage.length == self.capacity ? true : false
  end

  def dock(bike)
    fail "Cannot dock bike, at capacity" if self.full?
    self.storage << bike
  end

  private def empty?
    self.storage == [] ? true : false
  end

  def release_bike
    fail "No bikes available" if self.empty?
    fail "Bike is broken!" unless self.storage[0].working?
    self.storage[0]
  end

end

class Bike
attr_accessor :name, :condition

  def initialize(name='test', condition=true)
    @name = name
    @condition = condition
  end

  def working?
    self.condition ? true : false
  end

  def report
    self.condition = false
  end

end

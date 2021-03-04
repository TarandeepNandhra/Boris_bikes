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
    self.storage << bike.name
  end

  private def empty?
    self.storage != [] ? true : false
  end

  def release_bike
    self.storage[0] if self.empty?
    fail "No bikes available"
  end

end

class Bike
attr_accessor :name

  def initialize(name='test')
    @name = name
  end

  def working?
    true
  end

end

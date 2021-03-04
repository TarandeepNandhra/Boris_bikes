class DockingStation
  attr_accessor :name, :storage, :capacity

  def initialize(name, storage=[], capacity=20)
    @name = name
    @storage = storage
    @capacity = capacity
  end

  def dock(bike)
    if self.storage.length == self.capacity
      fail "Cannot dock bike, at capacity"
    else
      self.storage << bike.name
    end
  end

  def is_there_a_bike?
    self.storage != [] ? true : false
  end

  def release_bike
    if self.is_there_a_bike?
      self.storage[0]
    else
      fail "No bikes available"
    end
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

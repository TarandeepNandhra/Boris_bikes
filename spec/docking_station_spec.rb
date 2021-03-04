require 'boris_bikes.rb'

describe 'DockingStation' do
  let(:central) { DockingStation.new 'central'}

  describe 'release_bike' do
    # Guard condition - bikes aren't allowed to release bikes!

    it "only works on instances of a DockingStation" do
      bike = Bike.new('error')
      expect { bike.release_bike }.to raise_error(NoMethodError)
    end

    it "fails if storage is empty" do
      expect { central.release_bike }.to raise_error("No bikes available")
    end

    it 'fails if first bike to release is broken' do
      bike = Bike.new('bike')
      bike.report
      central.dock(bike)
      expect { central.release_bike }.to raise_error("Bike is broken!")
    end
  end

  describe 'dock' do

    it 'accepts broken bikes' do
      expect do
        bike = Bike.new
        bike.report
        central.dock(bike)
        expect(central.storage[0]).to be_kind_of(Bike)
      end
    end

    it "stores a working bike in a docking station" do
      expect do
        unicycle = Bike.new
        central.dock(unicycle)
        expect(central.storage[0]).to be_kind_of(Bike)
      end
    end

    # Guard condition - capacity

    it 'fails when default set capacity is reached' do
      normal_docking_station = DockingStation.new('normal')
      expect { (DockingStation::DEFAULT_CAPACITY + 1).times { normal_docking_station.dock(Bike.new) } }.to raise_error("Cannot dock bike, at capacity")
    end

    it 'can dock bikes up to a custom capacity DockingStation' do
      large_docking_station = DockingStation.new('large', [], 100)
      100.times { large_docking_station.dock(Bike.new)}
      expect(large_docking_station.storage.length).to eq(100)
    end
  end
end

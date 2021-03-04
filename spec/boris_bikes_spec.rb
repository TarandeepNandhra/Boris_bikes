require 'boris_bikes.rb'

# As a person,
# So that I can use a bike,
# I'd like a docking station to release a bike.

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
  end

  describe 'dock' do
    it "stores a bike in a docking station" do
      expect do
        unicycle = Bike.new('unicycle')
        central.dock(unicycle)
        expect(entral.storage[0]).to eq("unicycle")
      end
    end

    # Guard condition - capacity
    
    it 'fails when default set capacity is reached' do
      large_docking_station = DockingStation.new('large')
      expect { 21.times { large_docking_station.dock(Bike.new) } }.to raise_error("Cannot dock bike, at capacity")
    end
  end

  describe 'is_there_a_bike?' do
    it "checks if there is a bike in the instance variable of a docking station instance" do
      expect do
        unicycle = Bike.new('unicycle')
        expect(central.is_there_a_bike?).to eq(false)
      end
    end

    it "returns a bike name if there is a bike in storage" do
      unicycle = Bike.new('unicycle')
      central.dock(unicycle)
      expect(central.is_there_a_bike?).to eq(true)
    end
  end
end

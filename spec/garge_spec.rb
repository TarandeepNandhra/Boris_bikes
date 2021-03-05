require 'boris_bikes.rb'

describe "Garage" do
  let(:hub) { Garage.new 'hub' }
  let(:bike) { double(:bike) }

  describe "deliver" do
    it "delivers broken bikes" do
      bike.deliver
      expect(hub.storage[0]).to be_kind_of(Bike)
    end
  end
end

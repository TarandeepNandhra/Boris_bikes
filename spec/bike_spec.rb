require 'boris_bikes.rb'

# We can use predicate matchers any time we're working with methods that end with a ?

# expect(obj).to respond_to(:foo).with(1).argument

describe 'Bike' do
  let(:tricycle) {Bike.new('tricycle', true)}

  describe 'working?' do
    it 'returns true if a bike condition is true' do
      expect(tricycle.working?).to eq true
    end
  end

  describe 'report' do
    it 'allows a person to report a bike as broken' do
      tricycle.report
      expect(tricycle.working?).to eq(false)
    end
  end

end

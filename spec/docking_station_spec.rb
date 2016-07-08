require 'docking_station'

describe DockingStation do
=begin
  it 'releases working bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
=end
  describe 'initialization' do

    it 'has a variable capacity' do
      bike = double(:bike)
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock (bike) }
      expect { docking_station.dock (bike)}.to raise_error 'Docking station full'
    end

   subject {DockingStation.new}
   let(:bike) {double(:bike)}
  it 'has a default capacity' do
  described_class::DEFAULT_CAPACITY.times do
    subject.dock(bike)
    end
    expect {subject.dock(bike)}.to raise_error 'Docking station full'
  end
end


  describe '#release_bike' do

    it 'releases a bike' do
      bike = double(:bike, broken?: false)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error("No bikes available")
    end

    it 'does not release a broken bike' do
    bike = double(:bike, broken?: true)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error("Bike is broken")
    end
  end

   describe '#dock' do
     it 'raises an error when full' do
       bike = double(:bike)
       subject.capacity.times { subject.dock(bike) }
       expect { subject.dock(bike) }.to raise_error("Docking station full")
     end


   end


=begin
    it {is_expected.to respond_to :bikes}

    it 'list bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq bike
    end


    it {is_expected.to respond_to(:dock).with(1).argument}

    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
     end

=end
end

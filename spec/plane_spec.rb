require_relative('../plane')

describe Plane do
	subject(:plane_787) { Plane.new }

	describe "initalized state" do
	  it { should_not be_nil }
	  its(:fuel) { should eq 0 }
	  its(:passengers) { should be_nil }
	  its(:crew) { should be_nil }
	  its(:type) { should eq "787" }
	end
	

	describe "navigation controls" do
		it "flies" do
		  expect(plane_787.fly).to eq "flying"
		end

		it "takes off" do
			expect(plane_787.take_off).to eq "taking off"
		end
	end

	describe "dashboard gauges" do
		it "returns full fuel after refueling" do
			plane_787.refuel
			expect(plane_787.fuel).to eq 100
		end

		it "returns altitude during flight"
		it "returns speed"

	end

	describe "ready to take off" do
	  context "by checking" do
	  	it "if all the crew members are on-board"
	  	it "if all the passengers are on-board"
	  	it "if the plane is refueled"
	  	it "if the plane has been checked"
	  	it "if it has a flight path"
	  	it "if it has approval from air traffic control"
	  	it "if it has approval from HQ"
	  end
	end

	describe "crew info" do
	  it "should return a list of people with their roles"
	  it "knows if it has the right crew members to fly"
	  it "tells who is missing to make flight"
	end

	describe "passenger info" do
	  it "should return a list of passengers with their seat assignment"
	  it "should know if there are conflicting seating"
	end
end
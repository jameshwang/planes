require_relative('../plane')

describe Plane do
	subject(:plane_787) { Plane.new }

	it { should_not be_nil }

	describe "navigation controls" do
		it "flies" do
		  expect(plane_787.fly).to eq "flying"
		end

		it "takes off" do
			expect(plane_787.take_off).to eq "taking off"
		end
	end

	describe "dashboard gauges" do
		it "returns fuel amount when just starting" do
			expect(plane_787.fuel).to eq 0
		end

		it "returns full fuel after refueling" do
			plane_787.refuel
			expect(plane_787.fuel).to eq 100
		end
	end

	describe "ready to take off" do
	  it "should know if the plane can take off"
	end

	describe "crew info" do
	  it "should return a list of people with their roles"
	  it "knows if it has the right crew members to fly"
	  it "tells who is missing to make flight"
	end

	describe "passenger info" do
	  it "should return a list of passengers with their seat assignment"
	  it "should know if there are conflicting seating"
	  it ""
	end
end
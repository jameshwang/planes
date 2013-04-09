require_relative('../plane')

describe Plane do
  subject(:plane_787) { Plane.new("787", { pilot: 1, co_pilot: 1, flight_attendent: 5 }) }

  describe "initalized state" do
    it { should_not be_nil }
    its(:fuel) { should eq 0 }
    its(:passengers) { should be_nil }
    its(:crew) { should eq [] }
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
    context "#altitude" do
      it "returns altitude of 14000ft during flight" do
        plane_787.take_off
        expect(plane_787.altitude).to eq 14000
      end

      it "returns altitude of 0 while on the ground before take off" do
        expect(plane_787.altitude).to eq 0
      end

      it "returns altitude of 0 after landing" do
        plane_787.land
        expect(plane_787.altitude).to eq 0
      end
    end
    it "returns speed"
  end

  describe "crew info" do
    before(:each) do
      @tom = double("Crew", name: "Tom", role: "Pilot")
      @jane = double("Crew", name: "Jane", role: "Co-Pilot")
      @tom.stub(:to_h).and_return({ name: @tom.name, role: @tom.role })
      @jane.stub(:to_h).and_return({ name: @jane.name, role: @jane.role })
      @tom.stub(:role).and_return(@tom.role)
      @jane.stub(:role).and_return(@jane.role)
    end

    it "adds crew members to itself" do
      expect(plane_787.add_crew(@tom)).to eq [{name: "Tom", role: "Pilot"}]
    end
    context "after adding the Pilot and Co-Pilot" do
      before(:each) do
        plane_787.add_crew @tom
        plane_787.add_crew @jane
      end
      it "#crew should return a list of people with their roles" do
        expect(plane_787.crew).to eq [{name: "Tom", role: "Pilot"},
                                      {name: "Jane", role: "Co-Pilot"}]
      end

      it "#role_call returns a list of crew roles and number of members per role" do
        expect(plane_787.role_call).to eq({pilot: 1, co_pilot: 1})
      end

      it "#role_call returns 1 Pilot and 2 Co-Pilots" do
        plane_787.add_crew @jane
        expect(plane_787.role_call).to eq({pilot: 1, co_pilot: 2})
      end

      it "#roles returns only roles" do
        expect(plane_787.roles).to eq(['pilot', 'co_pilot'])
      end

      it "#crew_requirement? knows if it has the right crew members to fly" do
        @flight_attendent = double("Crew", name: "FA1", role: "Flight Attendent")
        @flight_attendent.stub(:to_h).and_return({ name: @flight_attendent.name, role: @flight_attendent.role })
        5.times { |a| plane_787.add_crew @flight_attendent }
        expect(plane_787.crew_requirement?).to be true
      end
    end

    it "#crew_requirement should be false since there's no crew" do
      expect(plane_787.crew_requirement?).to be false
    end


    it "#missing_crew_roles tells who is missing to make flight" do
      expect(plane_787.missing_crew_roles).to eq({ pilot: 1, co_pilot: 1, flight_attendent: 5 })
    end
  end

  describe "passenger info" do
    it "should return a list of passengers with their seat assignment"
    it "should know if there are conflicting seating"
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
end
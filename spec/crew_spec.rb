require_relative('../crew')

describe Crew do
  subject(:crew_member) { Crew.new }
  let(:plane) { double('Plane') }
  it { should_not be_nil }

  it "boards a plane and returns a plane with crew member aboard" do
  	plane.stub(:crew_list).and_return([crew_member])
    expect(plane.crew_list).to include crew_member
  end

end
require_relative("../spec_helper")

describe R2d2::Commands::Place do

	before do
		@place = R2d2::Commands::Place.new({:arguments=>"0,0,North"})
	end

	it "should parse arguments" do
		@place.coordinate.should be_eql(R2d2::Coordinate.new(0, 0, "North"))
	end

	it "should place rover in right place in space" do
		robot = R2d2::Robot.new
		@place.execute(robot)
		robot.position.should == R2d2::Coordinate.new(0, 0, "North")
	end
end
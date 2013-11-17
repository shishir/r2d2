require_relative("../spec_helper")

describe R2d2::Commands::Place do

	before do
		@place = R2d2::Commands::Place.new({:arguments=>"0,0,NORTH"})
	end

	it "should parse arguments" do
		@place.position.should == R2d2::Position.new(R2d2::Coordinate.new(0, 0), R2d2::Directions::North.new)
	end

	it "should place rover in right place in space" do
		robot = R2d2::Robot.new
		@place.execute(robot)
		robot.position.should == R2d2::Position.new(R2d2::Coordinate.new(0, 0), R2d2::Directions::North.new)
	end
end

describe R2d2::Commands::Move do

	before do
		@move   = R2d2::Commands::Move.new
	end

	it "should move the robot in right place in space" do
		robot = R2d2::Robot.new
		place = R2d2::Commands::Place.new({:arguments=>"0,0,North"})
		place.execute(robot)

		@move.execute(robot)
		robot.position.should == R2d2::Position.new(R2d2::Coordinate.new(0, 1), R2d2::Directions::North.new)
	end

	it "should move the robot in right place in space" do
		place = R2d2::Commands::Place.new({:arguments=>"0,0,North"})
		robot = R2d2::Robot.new

		place.execute(robot)

		@move.execute(robot)
		robot.position.should == R2d2::Position.new(R2d2::Coordinate.new(0, 1), R2d2::Directions::North.new)
	end

	it "should move the robot south" do
		place = R2d2::Commands::Place.new({:arguments=>"0,5,South"})
		robot = R2d2::Robot.new

		place.execute(robot)

		@move.execute(robot)
		robot.position.should == R2d2::Position.new(R2d2::Coordinate.new(0, 4), R2d2::Directions::South.new)
	end

	it "should move the robot east" do
		place = R2d2::Commands::Place.new({:arguments=>"0,0,East"})
		robot = R2d2::Robot.new

		place.execute(robot)

		@move.execute(robot)
		robot.position.should == R2d2::Position.new(R2d2::Coordinate.new(1, 0), R2d2::Directions::East.new)
	end

	it "should move the robot west" do
		place = R2d2::Commands::Place.new({:arguments=>"5,0,West"})
		robot = R2d2::Robot.new

		place.execute(robot)

		@move.execute(robot)
		robot.position.should == R2d2::Position.new(R2d2::Coordinate.new(4, 0), R2d2::Directions::South.new)
	end

end
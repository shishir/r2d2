require_relative("../spec_helper")

module R2d2
  describe Commands::Place do

    before do
      @place = Commands::Place.new({:arguments=>"0,0,NORTH"})
    end

    it "should parse arguments" do
      @place.position.should == Position.new(Coordinate.new(0, 0), Directions::North.new)
    end

    it "should place rover in right place in space" do
      robot = Robot.new
      @place.execute(robot)
      robot.position.should == Position.new(Coordinate.new(0, 0), Directions::North.new)
    end

    it "should raise invalid direction exception if direction is not one of North, East, West, South" do
      expect {
        Commands::Place.new({:arguments=>"0,0,N"})
        }.to raise_exception(InvalidDirectionException)
    end
  end

  describe Commands::Move do

    before do
      @move   = Commands::Move.new
    end

    it "should move the robot in right place in space" do
      robot = Robot.new
      place = Commands::Place.new({:arguments=>"0,0,North"})
      place.execute(robot)

      @move.execute(robot)
      robot.position.should == Position.new(Coordinate.new(0, 1), Directions::North.new)
    end

    it "should move the robot in right place in space" do
      place = Commands::Place.new({:arguments=>"0,0,North"})
      robot = Robot.new

      place.execute(robot)

      @move.execute(robot)
      robot.position.should == Position.new(Coordinate.new(0, 1), Directions::North.new)
    end

    it "should move the robot south" do
      place = Commands::Place.new({:arguments=>"0,5,South"})
      robot = Robot.new
      place.execute(robot)

      @move.execute(robot)

      robot.position.should == Position.new(Coordinate.new(0, 4), Directions::South.new)
    end

    it "should move the robot east" do
      place = Commands::Place.new({:arguments=>"0,0,East"})
      robot = Robot.new
      place.execute(robot)

      @move.execute(robot)

      robot.position.should == Position.new(Coordinate.new(1, 0), Directions::East.new)
    end

    it "should move the robot west" do
      place = Commands::Place.new({:arguments=>"5,0,West"})
      robot = Robot.new
      place.execute(robot)

      @move.execute(robot)

      robot.position.should == Position.new(Coordinate.new(4, 0), Directions::South.new)
    end
  end

  describe Commands::Left do

    before do
      @left = Commands::Left.new
    end

    it "should change the robot direction to left" do
      robot = Robot.new
      place = Commands::Place.new({:arguments=>"0,0,North"})
      place.execute(robot)

      @left.execute(robot)
      robot.position.should == Position.new(Coordinate.new(0, 0), Directions::West.new)

      @left.execute(robot)
      robot.position.should == Position.new(Coordinate.new(0, 0), Directions::South.new)

      @left.execute(robot)
      robot.position.should == Position.new(Coordinate.new(0, 0), Directions::East.new)

      @left.execute(robot)
      robot.position.should == Position.new(Coordinate.new(0, 0), Directions::North.new)
    end
  end

  describe Commands::Right do

    before do
      @right = Commands::Right.new
    end

    it "should change the robot direction to left" do
      robot = Robot.new
      place = Commands::Place.new({:arguments=>"0,0,North"})
      place.execute(robot)

      @right.execute(robot)
      robot.position.should == Position.new(Coordinate.new(0, 0), Directions::East.new)

      @right.execute(robot)
      robot.position.should == Position.new(Coordinate.new(0, 0), Directions::South.new)

      @right.execute(robot)
      robot.position.should == Position.new(Coordinate.new(0, 0), Directions::West.new)

      @right.execute(robot)
      robot.position.should == Position.new(Coordinate.new(0, 0), Directions::North.new)
    end
  end
end
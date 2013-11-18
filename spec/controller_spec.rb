require_relative('./spec_helper')

module R2d2
  describe Controller do

    before(:each) do
      @logger = double("logger")
      @logger.stub(:info)
      @logger.stub(:error)
      @controller = Controller.new(:logger => @logger)
    end

    it "should handle wrong coordinate execption" do
      @logger.should_receive(:error).with("Wrong Command. Robot will fall off the board.\n")
      @controller.should_receive(:take_input).and_return("Place 0,0,North", "LEFT", "MOVE", "REPORT")
      4.times do
        @controller.run_commands
      end
    end

    it "should handle wrong coordinate execption" do
      @logger.should_receive(:error).with("Invalid usage of command 'Place'. Direction can be 'North', 'East', 'West', 'South'. eg. Place 0,0,North\n")
      @controller.should_receive(:take_input).and_return("Place 0,0,N")
      @controller.run_commands
    end

    it "#testcase 1" do
      @controller.should_receive(:take_input).and_return("PLACE 0,0,NORTH", "MOVE", "REPORT")

      3.times do
        @controller.run_commands
      end

      @controller.robot.position.should == Position.new(Coordinate.new(0,1), Directions::North)
    end

    it "#testcase 2" do
      @controller.should_receive(:take_input).and_return("PLACE 0,0,NORTH", "LEFT", "REPORT")

      3.times do
        @controller.run_commands
      end

      @controller.robot.position.should == Position.new(Coordinate.new(0,0), Directions::West)
    end

    it "#testcase 3" do
      @controller.should_receive(:take_input).and_return("PLACE 1,2,EAST", "MOVE", "MOVE", "LEFT", "MOVE", "REPORT")

      6.times do
        @controller.run_commands
      end

      @controller.robot.position.should == Position.new(Coordinate.new(3,3), Directions::North)
    end

  end
end
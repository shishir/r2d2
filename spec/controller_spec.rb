require_relative('./spec_helper')

describe R2d2::Controller do

  before do
    logger = double(logger)
    logger.stub(:info)
    logger.stub(:error)
    @controller = R2d2::Controller.new(:logger => logger)
  end

  it "should controller should read commands for the user" do
    @controller.should_receive(:take_input).and_return("PLACE 0,0,NORTH", "MOVE", "LEFT", "RIGHT", "REPORT")

    @controller.run_commands

    @controller.commands.count.should == 5
    @controller.commands[0].should be_instance_of(R2d2::Commands::Place)
    @controller.commands[1].should be_instance_of(R2d2::Commands::Move)
    @controller.commands[2].should be_instance_of(R2d2::Commands::Left)
    @controller.commands[3].should be_instance_of(R2d2::Commands::Right)
    @controller.commands[4].should be_instance_of(R2d2::Commands::Report)
  end

  it "should handle wrong coordinate execption" do
    @controller.should_receive(:take_input).and_return("Place 0,0,North", "LEFT", "MOVE", "REPORT")
    @controller.run_commands
  end

  it "#testcase 1" do
    @controller.should_receive(:take_input).and_return("PLACE 0,0,NORTH", "MOVE", "REPORT")

    @controller.run_commands

    @controller.robot.position.should == R2d2::Position.new(R2d2::Coordinate.new(0,1), R2d2::Directions::North)
  end

  it "#testcase 2" do
    @controller.should_receive(:take_input).and_return("PLACE 0,0,NORTH", "LEFT", "REPORT")

    @controller.run_commands

    @controller.robot.position.should == R2d2::Position.new(R2d2::Coordinate.new(0,0), R2d2::Directions::West)
  end

  it "#testcase 3" do
    @controller.should_receive(:take_input).and_return("PLACE 1,2,EAST", "MOVE", "MOVE", "LEFT", "MOVE", "REPORT")

    @controller.run_commands

    @controller.robot.position.should == R2d2::Position.new(R2d2::Coordinate.new(3,3), R2d2::Directions::North)
  end

end
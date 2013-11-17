require_relative('./spec_helper')

describe R2d2::Controller do

	before do
		@controller = R2d2::Controller.new
	end

	it "should controller should read commands for the user" do
		@controller.should_receive(:take_input).and_return("PLACE 0 0 NORTH\n", "REPORT\n")

		@controller.run_commands

		@controller.commands.count.should == 2
		@controller.commands[0].should be_instance_of(R2d2::Commands::Place)
		@controller.commands[1].should be_instance_of(R2d2::Commands::Report)
	end

end
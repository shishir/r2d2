require_relative("spec_helper")

describe R2d2::Robot do

	it "should not allow robot to fall over the edge" do
		robot = R2d2::Robot.new
		expect {
			robot.be_placed_at(R2d2::Coordinate.new(6, 6, "North"))
			}.to raise_exception R2d2::WrongCoordinatesException
	end


end
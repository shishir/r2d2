require_relative("spec_helper")

describe R2d2::Board do

	it "should determine if coordinate is outside boards boundary" do
		board = R2d2::Board.new(5, 5)

		board.outside_boundary?(R2d2::Coordinate.new(-1, 0, "North")).should == true
		board.outside_boundary?(R2d2::Coordinate.new(0, -1, "North")).should == true
		board.outside_boundary?(R2d2::Coordinate.new(6, 0, "North")).should == true
		board.outside_boundary?(R2d2::Coordinate.new(0, 6, "North")).should == true
		board.outside_boundary?(R2d2::Coordinate.new(6, 6, "North")).should == true
		board.outside_boundary?(R2d2::Coordinate.new(-1, -1, "North")).should == true

		board.outside_boundary?(R2d2::Coordinate.new(0, 0, "North")).should == false
		board.outside_boundary?(R2d2::Coordinate.new(5, 5, "North")).should == false
		board.outside_boundary?(R2d2::Coordinate.new(0, 5, "North")).should == false
		board.outside_boundary?(R2d2::Coordinate.new(5, 0, "North")).should == false
	end
end
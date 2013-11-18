require_relative("spec_helper")

module R2d2
  describe Robot do

    it "should not allow robot to fall over the edge" do
      robot = Robot.new
      expect {
        robot.be_placed_at(Position.new(Coordinate.new(6, 6), Directions::North.new))
        }.to raise_exception WrongPositionException
    end

  end
end
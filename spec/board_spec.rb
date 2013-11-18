require_relative("spec_helper")

module R2d2
    describe Board do

      it "should determine if coordinate is outside boards boundary" do
        board = Board.new(5, 5)

        board.outside_boundary?(Position.new(Coordinate.new(-1, 0), Directions::North.new)).should == true
        board.outside_boundary?(Position.new(Coordinate.new(0, -1), Directions::North.new)).should == true
        board.outside_boundary?(Position.new(Coordinate.new(6, 0), Directions::North.new)).should == true
        board.outside_boundary?(Position.new(Coordinate.new(0, 6), Directions::North.new)).should == true
        board.outside_boundary?(Position.new(Coordinate.new(6, 6), Directions::North.new)).should == true
        board.outside_boundary?(Position.new(Coordinate.new(-1, -1), Directions::North.new)).should == true

        board.outside_boundary?(Position.new(Coordinate.new(0, 0), Directions::North.new)).should == false
        board.outside_boundary?(Position.new(Coordinate.new(5, 5), Directions::North.new)).should == false
        board.outside_boundary?(Position.new(Coordinate.new(0, 5), Directions::North.new)).should == false
        board.outside_boundary?(Position.new(Coordinate.new(5, 0), Directions::North.new)).should == false
      end
    end
end
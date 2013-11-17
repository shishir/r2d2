module R2d2
	class WrongCoordinatesException < Exception; end;
	class Robot

		def initialize(options={})
			@logger = options[:logger]
			@board  = Board.new(5, 5, options)
		end

		def be_placed_at(coordinate)
			raise WrongCoordinatesException.new("Outside board boundary.") if @board.outside_boundary?(coordinate)
			@coordinate = coordinate
		end

		def position
			@coordinate
		end
	end
end
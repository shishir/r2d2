module R2d2
	class Board
		attr :x, :y

		def initialize(x, y, options={})
			@x      = x
			@y      = y
			@logger = options[:logger]
		end

		def outside_boundary?(coordinate)
			(0 > coordinate.x || coordinate.x > @x ) || (0 > coordinate.y || coordinate.y > @x )
		end

	end
end
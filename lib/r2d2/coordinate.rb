module R2d2
	class Coordinate
		attr_reader :x, :y, :head

		def initialize(x, y, head)
			@x    = x.to_i
			@y    = y.to_i
			@head = head
		end

		def == (other)
			x == other.x and y == other.y and head == other.head
		end

		def eql?(other)
			self.class == other.class && self == other
		end
	end
end
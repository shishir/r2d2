module R2d2
	module Directions

		class North

			def == (other)
				true
			end

			def move(coordinate)
				coordinate.increment_y
			end

			def eql?(other)
				self.class == other.class
			end
		end

		class South

			def == (other)
				true
			end

			def move(coordinate)
				coordinate.decrement_y
			end

			def eql?(other)
				self.class == other.class
			end
		end

		class East

			def == (other)
				true
			end

			def move(coordinate)
				coordinate.increment_x
			end

			def eql?(other)
				self.class == other.class
			end

		end

		class West

			def == (other)
				true
			end

			def move(coordinate)
				coordinate.decrement_x
			end

			def eql?(other)
				self.class == other.class
			end
		end


	end
end
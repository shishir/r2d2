module R2d2
	module Directions

		class North

			def == (other)
				true
			end

			def move(coordinate)
				coordinate.increment_y
			end

			def turn_left
				West.new
			end

			def turn_right
				East.new
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

			def turn_left
				East.new
			end

			def turn_right
				West.new
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

			def turn_left
				North.new
			end

			def turn_right
				South.new
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

			def turn_left
				South.new
			end

			def turn_right
				North.new
			end

			def eql?(other)
				self.class == other.class
			end
		end


	end
end
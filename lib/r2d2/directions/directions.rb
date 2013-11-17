module R2d2
  module Directions

    class Direction

      def == (other)
        true
      end

      def eql?(other)
        self.class == other.class
      end
    end

    class North

      def move(coordinate)
        coordinate.increment_y
      end

      def turn_left
        West.new
      end

      def turn_right
        East.new
      end
    end

    class South

      def move(coordinate)
        coordinate.decrement_y
      end

      def turn_left
        East.new
      end

      def turn_right
        West.new
      end
    end

    class East

      def move(coordinate)
        coordinate.increment_x
      end

      def turn_left
        North.new
      end

      def turn_right
        South.new
      end
    end

    class West

      def move(coordinate)
        coordinate.decrement_x
      end

      def turn_left
        South.new
      end

      def turn_right
        North.new
      end
    end

  end
end
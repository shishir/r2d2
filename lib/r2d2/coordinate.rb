module R2d2
  class Coordinate
    attr_reader :x, :y

    def initialize(x, y)
      @x    = x.to_i
      @y    = y.to_i
    end

    def increment_y
      Coordinate.new(@x, @y + 1)
    end

    def decrement_y
      Coordinate.new(@x, @y - 1)
    end

    def increment_x
      Coordinate.new(@x + 1, @y)
    end

    def decrement_x
      Coordinate.new(@x - 1, @y)
    end

    def == (other)
      x == other.x and y == other.y
    end

    def eql?(other)
      self.class == other.class && self == other
    end
  end

  class Position
    attr_reader :coordinate, :direction

    def initialize(coordinate, direction)
      @coordinate = coordinate
      @direction  = direction
    end

    def move
      Position.new(direction.move(@coordinate), @direction)
    end

    def turn_left
      Position.new(@coordinate, @direction.turn_left)
    end

    def turn_right
      Position.new(@coordinate, @direction.turn_right)
    end


    def == (other)
      self.coordinate == other.coordinate && self.direction == other.direction
    end

    def eq? (other)
      puts self.class == other.class
      puts self == other
      self.class == other.class && self == other
    end
  end
end
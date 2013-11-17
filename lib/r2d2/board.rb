module R2d2
  class Board
    attr :x, :y

    def initialize(x, y, options={})
      @x      = x
      @y      = y
      @logger = options[:logger]
    end

    def outside_boundary?(position)
      (0 > position.coordinate.x || position.coordinate.x > @x ) || (0 > position.coordinate.y || position.coordinate.y > @x )
    end

  end
end
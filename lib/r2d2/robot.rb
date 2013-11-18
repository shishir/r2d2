module R2d2
  class WrongPositionException < Exception; end;
  class Robot

    def initialize(options={})
      @logger = options[:logger]
      @board  = Board.new(5, 5, options)
    end

    def be_placed_at(position)
      raise WrongPositionException.new("Outside board boundary.") if @board.outside_boundary?(position)
      @position = position
    end

    def position
      @position
    end

    def move
      be_placed_at(position.move)
    end

    def turn_left
      be_placed_at(position.turn_left)
    end

    def turn_right
      be_placed_at(position.turn_right)
    end
  end
end
module R2d2
  class RobotNotInitializedException < Exception; end;
  class InvalidDirectionException < Exception; end;

  module Commands

    class Place
      attr_reader :position

      def initialize(options={})
        @logger     = options[:logger]
        @arguments  = options[:arguments]
        @position   = parse_arguments(@arguments)
      end

      def execute(robot)
        robot.be_placed_at(@position)
      end

      private
      def parse_arguments(args)
        x, y, head = args.split(',')
        R2d2::Position.new(R2d2::Coordinate.new(x, y), "R2d2::Directions::#{head.capitalize}".constantize.new)
      rescue NameError
        raise InvalidDirectionException
      end
    end

    class Report
      def initialize(options={})
      end

      def execute(robot)
      end
    end

    class Move

      def initialize(options={})
      end

      def execute(robot)
        raise RobotNotInitializedException unless robot.position
        robot.be_placed_at(robot.position.move)
      end

    end

    class Left
      def initialize(options={})
      end

      def execute(robot)
        raise RobotNotInitializedException unless robot.position
        robot.be_placed_at(robot.position.turn_left)
      end
    end

    class Right
      def initialize(options={})
      end

      def execute(robot)
        raise RobotNotInitializedException unless robot.position
        robot.be_placed_at(robot.position.turn_right)
      end
    end

  end
end
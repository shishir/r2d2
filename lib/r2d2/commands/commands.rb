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
      attr_reader :logger
      def initialize(options={})
        @logger = options[:logger]
      end

      def execute(robot)
        logger.info "#{robot.position.to_s}\n"
      end
    end

    class Move

      def initialize(options={}); end;

      def execute(robot)
        raise RobotNotInitializedException unless robot.position
        robot.move
      end

    end

    class Left
      def initialize(options={}); end;

      def execute(robot)
        raise RobotNotInitializedException unless robot.position
        robot.turn_left
      end
    end

    class Right
      def initialize(options={}); end;

      def execute(robot)
        raise RobotNotInitializedException unless robot.position
        robot.turn_right
      end
    end

  end
end
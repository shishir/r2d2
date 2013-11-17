module R2d2
	module Commands

		class Place
			attr_reader :coordinate

			def initialize(options={})
				@logger     = options[:logger]
				@arguments  = options[:arguments]
				@coordinate = parse_arguments(@arguments)
			end

			def execute(robot)
				robot.be_placed_at(@coordinate)
			end

			private
			def parse_arguments(args)
				x, y, head = args.split(',')
				R2d2::Coordinate.new(x, y, head)
			end
		end

		class Report
			def initialize(options={})
			end
		end

		class Move
			def initialize(options={})
			end
		end

		class Left
			def initialize(options={})
			end
		end

		class Right
			def initialize(options={})
			end
		end

	end
end
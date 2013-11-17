require 'logger'

require_relative 'r2d2/commands/commands'
require_relative 'r2d2/coordinate'
require_relative 'r2d2/core_ext/extensions'
require_relative 'r2d2/robot'
require_relative 'r2d2/board'
require_relative 'r2d2/directions/directions'

module R2d2

	class Controller

		attr_reader :commands, :logger, :robot

		def initialize
			@commands = []
			@logger   = ::Logger.new(STDOUT)
			@robot    = Robot.new(:logger => logger)
		end

		def run_commands

			begin
				print "$> "
				input              = take_input
				cmd_str, arguments = input.split(' ')

				options = {
					:logger 	 => logger,
					:arguments => arguments
				}

				command  = "R2d2::Commands::#{cmd_str.capitalize}".constantize.new(options)
				@commands << command
				command.execute(robot)
			rescue NameError => ex
				logger.error "Incorrect command. Command can be one of Place, Move, Left, Right, North, South"
			end while cmd_str.capitalize != "Report"

			puts @robot.position.to_s
		end

		def take_input
			gets.chomp
		end
	end
end


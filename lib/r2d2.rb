require 'logger'

require_relative 'r2d2/commands/commands'
require_relative 'r2d2/coordinate'
require_relative 'r2d2/core_ext/extensions'
require_relative 'r2d2/robot'

module R2d2

	class Controller

		attr_reader :commands, :logger

		def initialize
			@commands = []
			@logger   = ::Logger.new(STDOUT)
		end

		def run_commands
			begin
				print "$> "
				input              = take_input
				command, arguments = input.split(' ')

				options = {
					:logger 	 => @logger,
					:arguments => arguments
				}

				@commands << "R2d2::Commands::#{command.capitalize}".constantize.new(options)
			rescue NameError => ex
				logger.error "Incorrect command. Command can be one of Place, Move, Left, Right, North, South"
			end while command.capitalize != "Report"
		end

		def take_input
			gets.chomp
		end
	end
end


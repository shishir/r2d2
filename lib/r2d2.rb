require_relative 'r2d2/commands/place'
require_relative 'r2d2/commands/report'
require_relative 'r2d2/core_ext/extensions'

module R2d2
	class Controller

		attr_reader :commands

		def initialize
			@commands = []
		end

		def run_commands
			command = nil
			begin
				input = take_input
				command, arguments = input.chomp!.split(' ')
				@commands << "R2d2::Commands::#{command.capitalize}".constantize.new
			rescue NameError => ex
				puts "Incorrect command. Command can be one of Place, Move, Left, Right, North, South"
			end while command.capitalize != "Report"
		end

		def take_input
			gets
		end
	end
end


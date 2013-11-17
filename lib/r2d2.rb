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

    def initialize(options)
      @commands         = []
      @logger           = options[:logger]
      @robot            = Robot.new(:logger => logger)
    end

    def run_commands

      begin
        logger.info "$> "
        input              = take_input
        cmd_str, arguments = input.split(' ')

        options = {
          :logger    => logger,
          :arguments => arguments
        }

        command  = "R2d2::Commands::#{cmd_str.capitalize}".constantize.new(options)
        @commands << command
        command.execute(robot)

      rescue InvalidDirectionException
        logger.error("Direction in place command is wrong. use one of North, East, West, South. eg. Place 0,0,North\n")
      rescue RobotNotInitializedException
        logger.error("Robot needs to be placed on the board. use PLACE command. eg. Place 0,0,North\n")
      rescue WrongPositionException
        logger.error("Wrong Command. Robot will fall off the board.\n")
      rescue NameError
        logger.error "Incorrect command. Command can be one of Place, Move, Left, Right\n"
      end while cmd_str.capitalize != "Report"

      logger.info @robot.position.to_s
    end

    def take_input
      gets.chomp
    end
  end
end


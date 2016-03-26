module RoverChallenge
  class ControlCenter
    LEFT = 'L'.freeze
    RIGHT = 'R'.freeze
    MOVE = 'M'.freeze

    RoverOutOfBounds = Class.new(RuntimeError)

    attr_reader :plateau, :rover

    # @param [RoverChallenge::Plateau] plateau
    # @param [RoverChallenge::Rover] rover
    def initialize(plateau, rover)
      @plateau = plateau
      @rover = rover
    end

    # @param [Array<String>] commands
    def execute(commands)
      commands.each(&method(:execute_command))
    end

    private

      def execute_command(command)
        case command
          when LEFT then rover.left
          when RIGHT then rover.right
          when MOVE then move_rover
          else raise ArgumentError, "unknown command #{command}"
        end
      end

      def move_rover
        rover.move

        has_invalid_x = rover.point.x < plateau.min_x || rover.point.x > plateau.max_x
        has_invalid_y = rover.point.y < plateau.min_y || rover.point.y > plateau.max_y

        raise RoverOutOfBounds if has_invalid_x || has_invalid_y
      end
  end
end
require 'rover_challenge/rover'
require 'rover_challenge/navigation'
require 'rover_challenge/control_center'

module RoverChallenge
  POSITION_FORMAT = /\A(\d+\s+){2}[NESW]\z/.freeze
  COORDINATES_FORMAT = /\A(\d+\s*){2}\z/.freeze
  COMMANDS_FORMAT = /\A[LRM]*\z/.freeze

  NAVIGATION_MAP = {
    'N' => Navigation::North,
    'E' => Navigation::East,
    'S' => Navigation::South,
    'W' => Navigation::West,
  }.freeze

  Point = Struct.new(:x, :y)
  Plateau = Struct.new(:min_x, :min_y, :max_x, :max_y)

  def self.build_rover(position)
    position = normalize_input(position, POSITION_FORMAT)

    parts = position.split(/\s+/)

    point = Point.new(parts[0].to_i, parts[1].to_i)
    navigation = NAVIGATION_MAP.fetch(parts[2])

    Rover.new(point, navigation)
  end

  def self.build_plateau(coordinates)
    coordinates = normalize_input(coordinates, COORDINATES_FORMAT)

    max_x, max_y = coordinates.split(/\s+/)

    Plateau.new(0, 0, max_x.to_i, max_y.to_i)
  end

  def self.build_commands(commands)
    commands = normalize_input(commands, COMMANDS_FORMAT)
    commands.split('')
  end

  private

    def self.normalize_input(input, input_format)
      input = input.to_s.upcase.strip
      unless input =~ input_format
        raise ArgumentError, "invalid input format, #{input_format.to_s} expected."
      end
      input
    end


end
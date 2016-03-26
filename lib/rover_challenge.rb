require 'rover_challenge/rover'
require 'rover_challenge/navigation'

module RoverChallenge
  POSITION_FORMAT = /\A(\d+\s+){2}[NESW]\z/.freeze

  NAVIGATION_MAP = {
    'N' => Navigation::North,
    'E' => Navigation::East,
    'S' => Navigation::South,
    'W' => Navigation::West,
  }.freeze

  Point = Struct.new(:x, :y)

  def self.build_rover(position)
    position = position.to_s.upcase.strip

    unless position =~ POSITION_FORMAT
      raise ArgumentError, "invalid input format"
    end

    parts = position.split(/\s+/)

    point = Point.new(parts[0].to_i, parts[1].to_i)
    navigation = NAVIGATION_MAP.fetch(parts[2])

    Rover.new(point, navigation)
  end

end
require 'rover_challenge/rover'
require 'rover_challenge/navigation'

module RoverChallenge
  POSITION_FORMAT = /\A(\d+\s+){2}[NESW]\z/.freeze
  COORDINATES_FORMAT = /\A(\d+\s*){2}\z/.freeze

  NAVIGATION_MAP = {
    'N' => Navigation::North,
    'E' => Navigation::East,
    'S' => Navigation::South,
    'W' => Navigation::West,
  }.freeze

  Point = Struct.new(:x, :y)
  Plateau = Struct.new(:min_x, :min_y, :max_x, :max_y)

  def self.build_rover(position)
    position = position.to_s.upcase.strip

    unless position =~ POSITION_FORMAT
      raise ArgumentError, "invalid position format"
    end

    parts = position.split(/\s+/)

    point = Point.new(parts[0].to_i, parts[1].to_i)
    navigation = NAVIGATION_MAP.fetch(parts[2])

    Rover.new(point, navigation)
  end

  def self.build_plateau(coordinates)
    coordinates = coordinates.to_s.strip

    unless coordinates =~ COORDINATES_FORMAT
      raise ArgumentError, "invalid coordinates format"
    end

    max_x, max_y = coordinates.split(/\s+/)

    Plateau.new(0, 0, max_x.to_i, max_y.to_i)
  end

end
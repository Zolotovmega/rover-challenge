module RoverChallenge
  class Rover
    attr_reader :point, :navigation

    # @param [RoverChallenge::Point] point
    # @param [
    #   RoverChallenge::Navigation::North,
    #   RoverChallenge::Navigation::East,
    #   RoverChallenge::Navigation::South,
    #   RoverChallenge::Navigation::West,
    # ] point
    def initialize(point, navigation)
      @point = point
      @navigation = navigation
    end

    def move
      navigation.move(point)
    end

    def left
      @navigation = navigation.left
    end

    def right
      @navigation = navigation.right
    end

    def to_s
      [point.x, point.y, navigation.code].join(' ')
    end
  end
end
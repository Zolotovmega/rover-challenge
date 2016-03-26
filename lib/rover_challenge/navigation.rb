module RoverChallenge
  module Navigation
    class North
      # @param [RoverChallenge::Point] position
      def self.move(position)
        position.y += 1
      end

      def self.left
        Navigation::West
      end

      def self.right
        Navigation::East
      end

      def self.code
        'N'
      end
    end

    class East
      # @param [RoverChallenge::Point] position
      def self.move(position)
        position.x += 1
      end

      def self.left
        Navigation::North
      end

      def self.right
        Navigation::South
      end

      def self.code
        'E'
      end
    end

    class South
      # @param [RoverChallenge::Point] position
      def self.move(position)
        position.y -= 1
      end

      def self.left
        Navigation::East
      end

      def self.right
        Navigation::West
      end

      def self.code
        'S'
      end
    end

    class West
      # @param [RoverChallenge::Point] position
      def self.move(position)
        position.x -= 1
      end

      def self.left
        Navigation::South
      end

      def self.right
        Navigation::North
      end

      def self.code
        'W'
      end
    end
  end
end
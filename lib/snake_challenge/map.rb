class SnakeChallenge
	class Map < Points
		# the size of the map
		# @param [Array] size
		attr_reader :size

		def initialize points, size
			super points
			@size = size
		end

	end
end
